# IntelliJ IDEA Configuration for Mockito with Java 21

To properly configure IntelliJ IDEA to run tests with Mockito on Java 21, follow these steps:

## JUnit Run Configuration

1. Open Run/Debug Configurations (Run -> Edit Configurations)
2. Select your JUnit configuration (or create a new one)
3. Add the following to VM options:
   ```
   -javaagent:[YOUR_HOME_DIR]/.m2/repository/net/bytebuddy/byte-buddy-agent/1.14.11/byte-buddy-agent-1.14.11.jar -XX:+EnableDynamicAgentLoading
   ```
   (Replace `[YOUR_HOME_DIR]` with your actual home directory path)
4. Add the following to Environment variables:
   ```
   mockito.mockMaker=inline
   ```
5. Apply and OK

## Template Configuration (For All JUnit Tests)

1. Open Run/Debug Configurations (Run -> Edit Configurations)
2. Select "Templates" -> "JUnit"
3. Add the same VM options and environment variables as described above
4. Apply and OK

Now all your JUnit tests should run without Mockito agent warnings.
