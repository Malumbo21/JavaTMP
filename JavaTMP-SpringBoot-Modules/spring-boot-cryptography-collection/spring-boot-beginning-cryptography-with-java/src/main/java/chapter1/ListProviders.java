package chapter1;

import org.bouncycastle.jce.provider.BouncyCastleProvider;

import java.security.Provider;
import java.security.Security;

/**
 * List the currently installed providers in the Java Runtime
 */
public class ListProviders {
    public static void main(String[] args) {
        Security.addProvider(new BouncyCastleProvider());
        Provider[] providers = Security.getProviders();

        for (int i = 0; i != providers.length; i++) {
            System.out.println("Name: " + providers[i].getName() + Utils.makeBlankString(15 - providers[i].getName().length()) + " Version: " + providers[i].getVersion());
        }
    }
}
