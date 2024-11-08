package chapter5;

import org.bouncycastle.asn1.ASN1InputStream;
import org.bouncycastle.asn1.ASN1OctetString;
import org.bouncycastle.asn1.ASN1Sequence;
import org.bouncycastle.asn1.util.ASN1Dump;
import org.bouncycastle.jce.provider.BouncyCastleProvider;

import javax.crypto.Cipher;
import java.security.*;

/**
 * Basic class for exploring a PKCS #1 V1.5 Signature.
 */
public class PKCS1SigEncodingExample {
    static {
        // https://stackoverflow.com/questions/40975510/spring-boot-and-jca-providers
        if (Security.getProvider(BouncyCastleProvider.PROVIDER_NAME) == null) {
            Security.addProvider(new BouncyCastleProvider());
        }
    }
    public static void main(String[] args) throws Exception {
        KeyPairGenerator keyGen = KeyPairGenerator.getInstance("RSA", "BC");

        keyGen.initialize(512, new SecureRandom());

        KeyPair keyPair = keyGen.generateKeyPair();
        Signature signature = Signature.getInstance("SHA256withRSA", "BC");

        // generate a signature
        signature.initSign(keyPair.getPrivate());

        byte[] message = new byte[]{(byte) 'a', (byte) 'b', (byte) 'c'};

        signature.update(message);

        byte[] sigBytes = signature.sign();

        // open the signature
        Cipher cipher = Cipher.getInstance("RSA/None/PKCS1Padding", "BC");

        cipher.init(Cipher.DECRYPT_MODE, keyPair.getPublic());

        byte[] decSig = cipher.doFinal(sigBytes);

        // parse the signature
        ASN1InputStream aIn = new ASN1InputStream(decSig);
        ASN1Sequence seq = (ASN1Sequence) aIn.readObject();

        System.out.println(ASN1Dump.dumpAsString(seq));

        // grab a digest of the correct type
        MessageDigest hash = MessageDigest.getInstance("SHA-256", "BC");

        hash.update(message);

        ASN1OctetString sigHash = (ASN1OctetString) seq.getObjectAt(1);
        if (MessageDigest.isEqual(hash.digest(), sigHash.getOctets())) {
            System.out.println("hash verification succeeded");
        } else {
            System.out.println("hash verification failed");
        }
    }
}
