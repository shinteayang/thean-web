<%@ page import="java.io.*, org.apache.commons.net.ftp.*" %>
<%
  String server = "thean-ac.com";
  int port = 8011;
  String username = "shinteayang";
  String password = "sine1506";
  String remoteFilePath = "/test.mp4";
  String localFilePath = request.getParameter("file");

  FTPClient client = new FTPClient();
  client.connect(server, port);
  client.login(username, password);
  client.enterLocalPassiveMode();
  client.setFileType(FTP.BINARY_FILE_TYPE);

  File file = new File(localFilePath);
  InputStream inputStream = new FileInputStream(file);
  client.storeFile(remoteFilePath, inputStream);
  inputStream.close();
  client.logout();
  client.disconnect();
%>
