package publicadores;

public class ControladorUsuarioPublishProxy implements publicadores.ControladorUsuarioPublish {
  private String _endpoint = null;
  private publicadores.ControladorUsuarioPublish controladorUsuarioPublish = null;
  
  public ControladorUsuarioPublishProxy() {
    _initControladorUsuarioPublishProxy();
  }
  
  public ControladorUsuarioPublishProxy(String endpoint) {
    _endpoint = endpoint;
    _initControladorUsuarioPublishProxy();
  }
  
  private void _initControladorUsuarioPublishProxy() {
    try {
      controladorUsuarioPublish = (new publicadores.ControladorUsuarioPublishServiceLocator()).getControladorUsuarioPublishPort();
      if (controladorUsuarioPublish != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)controladorUsuarioPublish)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)controladorUsuarioPublish)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (controladorUsuarioPublish != null)
      ((javax.xml.rpc.Stub)controladorUsuarioPublish)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public publicadores.ControladorUsuarioPublish getControladorUsuarioPublish() {
    if (controladorUsuarioPublish == null)
      _initControladorUsuarioPublishProxy();
    return controladorUsuarioPublish;
  }
  
  public void confirmarAltaEstudiante(publicadores.DtEstudiante arg0) throws java.rmi.RemoteException, publicadores.UsuarioRepetido_Exception{
    if (controladorUsuarioPublish == null)
      _initControladorUsuarioPublishProxy();
    controladorUsuarioPublish.confirmarAltaEstudiante(arg0);
  }
  
  public publicadores.DtUsuario[] obtenerSeguidores(java.lang.String arg0) throws java.rmi.RemoteException{
    if (controladorUsuarioPublish == null)
      _initControladorUsuarioPublishProxy();
    return controladorUsuarioPublish.obtenerSeguidores(arg0);
  }
  
  public void confirmarAltaDocente(publicadores.DtDocente arg0) throws java.rmi.RemoteException, publicadores.UsuarioRepetido_Exception{
    if (controladorUsuarioPublish == null)
      _initControladorUsuarioPublishProxy();
    controladorUsuarioPublish.confirmarAltaDocente(arg0);
  }
  
  public java.lang.String[] listarEdicionesEst(java.lang.String arg0) throws java.rmi.RemoteException{
    if (controladorUsuarioPublish == null)
      _initControladorUsuarioPublishProxy();
    return controladorUsuarioPublish.listarEdicionesEst(arg0);
  }
  
  public publicadores.Instituto getInstituto(java.lang.String arg0) throws java.rmi.RemoteException{
    if (controladorUsuarioPublish == null)
      _initControladorUsuarioPublishProxy();
    return controladorUsuarioPublish.getInstituto(arg0);
  }
  
  public java.lang.String getCurso(java.lang.String arg0, publicadores.Curso[] arg1) throws java.rmi.RemoteException{
    if (controladorUsuarioPublish == null)
      _initControladorUsuarioPublishProxy();
    return controladorUsuarioPublish.getCurso(arg0, arg1);
  }
  
  public boolean existeUsuario(java.lang.String arg0) throws java.rmi.RemoteException{
    if (controladorUsuarioPublish == null)
      _initControladorUsuarioPublishProxy();
    return controladorUsuarioPublish.existeUsuario(arg0);
  }
  
  public publicadores.Edicion obtenerEdicion(java.lang.String arg0, java.lang.String arg1) throws java.rmi.RemoteException{
    if (controladorUsuarioPublish == null)
      _initControladorUsuarioPublishProxy();
    return controladorUsuarioPublish.obtenerEdicion(arg0, arg1);
  }
  
  public void seguirUsuario(java.lang.String arg0, java.lang.String arg1) throws java.rmi.RemoteException{
    if (controladorUsuarioPublish == null)
      _initControladorUsuarioPublishProxy();
    controladorUsuarioPublish.seguirUsuario(arg0, arg1);
  }
  
  public publicadores.DtUsuario[] obtenerSeguidos(java.lang.String arg0) throws java.rmi.RemoteException{
    if (controladorUsuarioPublish == null)
      _initControladorUsuarioPublishProxy();
    return controladorUsuarioPublish.obtenerSeguidos(arg0);
  }
  
  public boolean esSeguidor(java.lang.String arg0, java.lang.String arg1) throws java.rmi.RemoteException{
    if (controladorUsuarioPublish == null)
      _initControladorUsuarioPublishProxy();
    return controladorUsuarioPublish.esSeguidor(arg0, arg1);
  }
  
  public publicadores.Curso[] getCursos(publicadores.Instituto arg0) throws java.rmi.RemoteException{
    if (controladorUsuarioPublish == null)
      _initControladorUsuarioPublishProxy();
    return controladorUsuarioPublish.getCursos(arg0);
  }
  
  public java.lang.String nombresDocente(publicadores.Edicion arg0) throws java.rmi.RemoteException{
    if (controladorUsuarioPublish == null)
      _initControladorUsuarioPublishProxy();
    return controladorUsuarioPublish.nombresDocente(arg0);
  }
  
  public void dejarSeguir(java.lang.String arg0, java.lang.String arg1) throws java.rmi.RemoteException{
    if (controladorUsuarioPublish == null)
      _initControladorUsuarioPublishProxy();
    controladorUsuarioPublish.dejarSeguir(arg0, arg1);
  }
  
  public java.lang.String[] atributosEdicion(java.lang.String arg0, java.lang.String arg1) throws java.rmi.RemoteException{
    if (controladorUsuarioPublish == null)
      _initControladorUsuarioPublishProxy();
    return controladorUsuarioPublish.atributosEdicion(arg0, arg1);
  }
  
  public void confirmarAlta(publicadores.DtUsuario arg0) throws java.rmi.RemoteException, publicadores.UsuarioRepetido_Exception{
    if (controladorUsuarioPublish == null)
      _initControladorUsuarioPublishProxy();
    controladorUsuarioPublish.confirmarAlta(arg0);
  }
  
  public java.lang.String[] listarInstitutos() throws java.rmi.RemoteException{
    if (controladorUsuarioPublish == null)
      _initControladorUsuarioPublishProxy();
    return controladorUsuarioPublish.listarInstitutos();
  }
  
  public void ingresarInstitutoDocente(java.lang.String arg0) throws java.rmi.RemoteException{
    if (controladorUsuarioPublish == null)
      _initControladorUsuarioPublishProxy();
    controladorUsuarioPublish.ingresarInstitutoDocente(arg0);
  }
  
  public java.lang.String[] atributosPrograma(java.lang.String arg0) throws java.rmi.RemoteException{
    if (controladorUsuarioPublish == null)
      _initControladorUsuarioPublishProxy();
    return controladorUsuarioPublish.atributosPrograma(arg0);
  }
  
  public java.lang.String[] listarEdicionesD(java.lang.String arg0) throws java.rmi.RemoteException{
    if (controladorUsuarioPublish == null)
      _initControladorUsuarioPublishProxy();
    return controladorUsuarioPublish.listarEdicionesD(arg0);
  }
  
  public java.lang.String[] listarEdicionesE(java.lang.String arg0) throws java.rmi.RemoteException{
    if (controladorUsuarioPublish == null)
      _initControladorUsuarioPublishProxy();
    return controladorUsuarioPublish.listarEdicionesE(arg0);
  }
  
  public java.lang.String[] listarProgramasE(java.lang.String arg0) throws java.rmi.RemoteException{
    if (controladorUsuarioPublish == null)
      _initControladorUsuarioPublishProxy();
    return controladorUsuarioPublish.listarProgramasE(arg0);
  }
  
  public boolean esEstudiante(java.lang.String arg0) throws java.rmi.RemoteException{
    if (controladorUsuarioPublish == null)
      _initControladorUsuarioPublishProxy();
    return controladorUsuarioPublish.esEstudiante(arg0);
  }
  
  public publicadores.DtUsuario consultaUsuario(java.lang.String arg0) throws java.rmi.RemoteException{
    if (controladorUsuarioPublish == null)
      _initControladorUsuarioPublishProxy();
    return controladorUsuarioPublish.consultaUsuario(arg0);
  }
  
  public java.lang.String[] listarUsuarios() throws java.rmi.RemoteException{
    if (controladorUsuarioPublish == null)
      _initControladorUsuarioPublishProxy();
    return controladorUsuarioPublish.listarUsuarios();
  }
  
  public java.lang.String getContraseniaUsuario(java.lang.String arg0) throws java.rmi.RemoteException{
    if (controladorUsuarioPublish == null)
      _initControladorUsuarioPublishProxy();
    return controladorUsuarioPublish.getContraseniaUsuario(arg0);
  }
  
  public java.lang.String getApellidoUsuario(java.lang.String arg0) throws java.rmi.RemoteException{
    if (controladorUsuarioPublish == null)
      _initControladorUsuarioPublishProxy();
    return controladorUsuarioPublish.getApellidoUsuario(arg0);
  }
  
  public java.lang.String getNombreUsuario(java.lang.String arg0) throws java.rmi.RemoteException{
    if (controladorUsuarioPublish == null)
      _initControladorUsuarioPublishProxy();
    return controladorUsuarioPublish.getNombreUsuario(arg0);
  }
  
  public void modificarUsuario(java.lang.String arg0, java.lang.String arg1, java.lang.String arg2, java.util.Calendar arg3, java.lang.String arg4) throws java.rmi.RemoteException{
    if (controladorUsuarioPublish == null)
      _initControladorUsuarioPublishProxy();
    controladorUsuarioPublish.modificarUsuario(arg0, arg1, arg2, arg3, arg4);
  }
  
  
}