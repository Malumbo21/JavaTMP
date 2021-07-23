package com.javatmp.demo.crypto.certificate.example;

import com.javatmp.demo.crypto.certificate.Utils;
import org.bouncycastle.asn1.pkcs.CertificationRequest;
import org.bouncycastle.asn1.x500.X500Name;
import org.bouncycastle.asn1.x509.SubjectPublicKeyInfo;
import org.bouncycastle.jce.provider.BouncyCastleProvider;
import org.bouncycastle.operator.ContentSigner;
import org.bouncycastle.operator.jcajce.JcaContentSignerBuilder;
import org.bouncycastle.pkcs.PKCS10CertificationRequest;
import org.bouncycastle.pkcs.PKCS10CertificationRequestBuilder;
import org.bouncycastle.util.io.pem.PemObject;
import org.bouncycastle.util.io.pem.PemWriter;

import java.io.OutputStreamWriter;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.Security;

/**
 * Generation of a basic PKCS #10 request.
 */
public class PKCS10CertRequestExampleNew {
    static {
        // https://stackoverflow.com/questions/40975510/spring-boot-and-jca-providers
        if (Security.getProvider(BouncyCastleProvider.PROVIDER_NAME) == null) {
            Security.addProvider(new BouncyCastleProvider());
        }
    }
    public static PKCS10CertificationRequest generateRequest(KeyPair pair)
            throws Exception {
        CertificationRequest csr = null;
        PKCS10CertificationRequestBuilder b =
                new PKCS10CertificationRequestBuilder(
                        new X500Name("CN=Requested Test Certificate"),
                        SubjectPublicKeyInfo.getInstance(pair.getPublic().getEncoded())
                );
        final ContentSigner signer =
                new JcaContentSignerBuilder("SHA256WithRSAEncryption")
                        .setProvider(BouncyCastleProvider.PROVIDER_NAME)
                        .build(pair.getPrivate());
        PKCS10CertificationRequest pkcs10CertificationRequest = b.build(signer);
        return pkcs10CertificationRequest;
    }

    public static void main(String[] args) throws Exception {
        // create the keys
        KeyPairGenerator kpGen = KeyPairGenerator.getInstance("RSA", "BC");

        kpGen.initialize(1024, Utils.createFixedRandom());

        KeyPair pair = kpGen.generateKeyPair();

        PKCS10CertificationRequest request = generateRequest(pair);

        PemWriter pemWrt = new PemWriter(new OutputStreamWriter(System.out));

        pemWrt.writeObject(
                new PemObject("CERTIFICATE REQUEST",
                        request.getEncoded()));
        pemWrt.close();
    }
}