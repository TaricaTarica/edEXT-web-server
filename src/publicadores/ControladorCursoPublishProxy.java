package publicadores;

public class ControladorCursoPublishProxy implements publicadores.ControladorCursoPublish {
  private String _endpoint = null;
  private publicadores.ControladorCursoPublish controladorCursoPublish = null;
  
  public ControladorCursoPublishProxy() {
    _initControladorCursoPublishProxy();
  }
  
  public ControladorCursoPublishProxy(String endpoint) {
    _endpoint = endpoint;
    _initControladorCursoPublishProxy();
  }
  
  private void _initControladorCursoPublishProxy() {
    try {
      controladorCursoPublish = (new publicadores.ControladorCursoPublishServiceLocator()).getControladorCursoPublishPort();
      if (controladorCursoPublish != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)controladorCursoPublish)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)controladorCursoPublish)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (controladorCursoPublish != null)
      ((javax.xml.rpc.Stub)controladorCursoPublish)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public publicadores.ControladorCursoPublish getControladorCursoPublish() {
    if (controladorCursoPublish == null)
      _initControladorCursoPublishProxy();
    return controladorCursoPublish;
  }
  
  public java.lang.String[] listarCursosCategoria(java.lang.String arg0) throws java.rmi.RemoteException{
    if (controladorCursoPublish == null)
      _initControladorCursoPublishProxy();
    return controladorCursoPublish.listarCursosCategoria(arg0);
  }
  
  public void agregarCursoProgFormacion2(java.lang.String arg0, java.lang.String arg1, java.lang.String arg2) throws java.rmi.RemoteException, publicadores.ProgramaCursoRepetido_Exception{
    if (controladorCursoPublish == null)
      _initControladorCursoPublishProxy();
    controladorCursoPublish.agregarCursoProgFormacion2(arg0, arg1, arg2);
  }
  
  public publicadores.DtCursoInfo consultaCursoCategoria(java.lang.String arg0, java.lang.String arg1) throws java.rmi.RemoteException{
    if (controladorCursoPublish == null)
      _initControladorCursoPublishProxy();
    return controladorCursoPublish.consultaCursoCategoria(arg0, arg1);
  }
  
  public publicadores.DtinfoEdicion consultaEdicion(java.lang.String arg0, java.lang.String arg1, java.lang.String arg2) throws java.rmi.RemoteException{
    if (controladorCursoPublish == null)
      _initControladorCursoPublishProxy();
    return controladorCursoPublish.consultaEdicion(arg0, arg1, arg2);
  }
  
  public void ingresarPrevia(java.lang.String arg0) throws java.rmi.RemoteException{
    if (controladorCursoPublish == null)
      _initControladorCursoPublishProxy();
    controladorCursoPublish.ingresarPrevia(arg0);
  }
  
  public publicadores.DtCurso[] busquedaCurso(java.lang.String arg0) throws java.rmi.RemoteException{
    if (controladorCursoPublish == null)
      _initControladorCursoPublishProxy();
    return controladorCursoPublish.busquedaCurso(arg0);
  }
  
  public void ingresarCurso(java.lang.String arg0, java.lang.String arg1, java.lang.String arg2, java.lang.String arg3, int arg4, int arg5, java.util.Calendar arg6, java.lang.String arg7) throws java.rmi.RemoteException{
    if (controladorCursoPublish == null)
      _initControladorCursoPublishProxy();
    controladorCursoPublish.ingresarCurso(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7);
  }
  
  public java.lang.String getInstitutoDocente(java.lang.String arg0) throws java.rmi.RemoteException{
    if (controladorCursoPublish == null)
      _initControladorCursoPublishProxy();
    return controladorCursoPublish.getInstitutoDocente(arg0);
  }
  
  public java.lang.String[] listarEdicionesCategoria(java.lang.String arg0, java.lang.String arg1) throws java.rmi.RemoteException{
    if (controladorCursoPublish == null)
      _initControladorCursoPublishProxy();
    return controladorCursoPublish.listarEdicionesCategoria(arg0, arg1);
  }
  
  public publicadores.DtInscripcionEd[] obtenerInscripcionesEd(java.lang.String arg0, java.lang.String arg1, java.lang.String arg2) throws java.rmi.RemoteException{
    if (controladorCursoPublish == null)
      _initControladorCursoPublishProxy();
    return controladorCursoPublish.obtenerInscripcionesEd(arg0, arg1, arg2);
  }
  
  public java.lang.String obtenerInstitutoCursoPrograma(java.lang.String arg0, java.lang.String arg1) throws java.rmi.RemoteException{
    if (controladorCursoPublish == null)
      _initControladorCursoPublishProxy();
    return controladorCursoPublish.obtenerInstitutoCursoPrograma(arg0, arg1);
  }
  
  public void seleccionarestadoInscripcion(java.lang.String arg0, java.lang.String arg1, java.lang.String arg2, java.lang.String arg3, java.lang.String arg4) throws java.rmi.RemoteException{
    if (controladorCursoPublish == null)
      _initControladorCursoPublishProxy();
    controladorCursoPublish.seleccionarestadoInscripcion(arg0, arg1, arg2, arg3, arg4);
  }
  
  public java.lang.String obtenerInstitutoCurso(java.lang.String arg0) throws java.rmi.RemoteException{
    if (controladorCursoPublish == null)
      _initControladorCursoPublishProxy();
    return controladorCursoPublish.obtenerInstitutoCurso(arg0);
  }
  
  public publicadores.DtinfoEdicion consultaEdicionCategoria(java.lang.String arg0, java.lang.String arg1, java.lang.String arg2) throws java.rmi.RemoteException{
    if (controladorCursoPublish == null)
      _initControladorCursoPublishProxy();
    return controladorCursoPublish.consultaEdicionCategoria(arg0, arg1, arg2);
  }
  
  public java.lang.String[] listarPrevias(java.lang.String arg0, java.lang.String arg1) throws java.rmi.RemoteException{
    if (controladorCursoPublish == null)
      _initControladorCursoPublishProxy();
    return controladorCursoPublish.listarPrevias(arg0, arg1);
  }
  
  public java.lang.String[] listarCursos(java.lang.String arg0) throws java.rmi.RemoteException{
    if (controladorCursoPublish == null)
      _initControladorCursoPublishProxy();
    return controladorCursoPublish.listarCursos(arg0);
  }
  
  public java.lang.String[] listarEdiciones(java.lang.String arg0, java.lang.String arg1) throws java.rmi.RemoteException{
    if (controladorCursoPublish == null)
      _initControladorCursoPublishProxy();
    return controladorCursoPublish.listarEdiciones(arg0, arg1);
  }
  
  public java.lang.String[] atributosEdicion(java.lang.String arg0, java.lang.String arg1, java.lang.String arg2) throws java.rmi.RemoteException{
    if (controladorCursoPublish == null)
      _initControladorCursoPublishProxy();
    return controladorCursoPublish.atributosEdicion(arg0, arg1, arg2);
  }
  
  public publicadores.DtCursoInfo consultaCurso(java.lang.String arg0, java.lang.String arg1) throws java.rmi.RemoteException{
    if (controladorCursoPublish == null)
      _initControladorCursoPublishProxy();
    return controladorCursoPublish.consultaCurso(arg0, arg1);
  }
  
  public void altaInstituto(java.lang.String arg0) throws java.rmi.RemoteException, publicadores.InstitutoRepetido_Exception{
    if (controladorCursoPublish == null)
      _initControladorCursoPublishProxy();
    controladorCursoPublish.altaInstituto(arg0);
  }
  
  public java.lang.String[] listarInstitutos() throws java.rmi.RemoteException{
    if (controladorCursoPublish == null)
      _initControladorCursoPublishProxy();
    return controladorCursoPublish.listarInstitutos();
  }
  
  public void agregarCategorias(java.lang.String arg0, java.lang.String arg1, java.lang.String arg2) throws java.rmi.RemoteException{
    if (controladorCursoPublish == null)
      _initControladorCursoPublishProxy();
    controladorCursoPublish.agregarCategorias(arg0, arg1, arg2);
  }
  
  public java.lang.String[] atributosPrograma(java.lang.String arg0) throws java.rmi.RemoteException{
    if (controladorCursoPublish == null)
      _initControladorCursoPublishProxy();
    return controladorCursoPublish.atributosPrograma(arg0);
  }
  
  public void altadeEdiciondeCurso(publicadores.DtEdicion arg0, java.lang.String arg1, java.lang.String arg2) throws java.rmi.RemoteException, publicadores.EdicionRepatida_Exception{
    if (controladorCursoPublish == null)
      _initControladorCursoPublishProxy();
    controladorCursoPublish.altadeEdiciondeCurso(arg0, arg1, arg2);
  }
  
  public void altaCrearProgramadeFormacion(publicadores.DtProgramaFormacion arg0) throws java.rmi.RemoteException, publicadores.CrearProgramaFormacionRepetido_Exception{
    if (controladorCursoPublish == null)
      _initControladorCursoPublishProxy();
    controladorCursoPublish.altaCrearProgramadeFormacion(arg0);
  }
  
  public java.lang.String[] listarProgramasAux(java.lang.String arg0, java.lang.String arg1) throws java.rmi.RemoteException{
    if (controladorCursoPublish == null)
      _initControladorCursoPublishProxy();
    return controladorCursoPublish.listarProgramasAux(arg0, arg1);
  }
  
  public java.lang.String[] listarCategoriasC(java.lang.String arg0, java.lang.String arg1) throws java.rmi.RemoteException{
    if (controladorCursoPublish == null)
      _initControladorCursoPublishProxy();
    return controladorCursoPublish.listarCategoriasC(arg0, arg1);
  }
  
  public publicadores.DtProgramaFormacion consultaProgramaFormacion(java.lang.String arg0) throws java.rmi.RemoteException{
    if (controladorCursoPublish == null)
      _initControladorCursoPublishProxy();
    return controladorCursoPublish.consultaProgramaFormacion(arg0);
  }
  
  public java.lang.String[] listarCursosCategoriasP(java.lang.String arg0) throws java.rmi.RemoteException{
    if (controladorCursoPublish == null)
      _initControladorCursoPublishProxy();
    return controladorCursoPublish.listarCursosCategoriasP(arg0);
  }
  
  public java.lang.String[] listarCursosP(java.lang.String arg0) throws java.rmi.RemoteException{
    if (controladorCursoPublish == null)
      _initControladorCursoPublishProxy();
    return controladorCursoPublish.listarCursosP(arg0);
  }
  
  public java.lang.String[] listarProgramas() throws java.rmi.RemoteException{
    if (controladorCursoPublish == null)
      _initControladorCursoPublishProxy();
    return controladorCursoPublish.listarProgramas();
  }
  
  public void altaCurso(publicadores.DtCurso arg0, java.lang.String arg1) throws java.rmi.RemoteException, publicadores.CursoRepetido_Exception{
    if (controladorCursoPublish == null)
      _initControladorCursoPublishProxy();
    controladorCursoPublish.altaCurso(arg0, arg1);
  }
  
  public void asociarEdicion(java.lang.String arg0, publicadores.DtEdicion arg1, java.lang.String arg2, java.lang.String arg3) throws java.rmi.RemoteException{
    if (controladorCursoPublish == null)
      _initControladorCursoPublishProxy();
    controladorCursoPublish.asociarEdicion(arg0, arg1, arg2, arg3);
  }
  
  public void agregarPrevia(java.lang.String arg0, java.lang.String arg1, java.lang.String arg2) throws java.rmi.RemoteException{
    if (controladorCursoPublish == null)
      _initControladorCursoPublishProxy();
    controladorCursoPublish.agregarPrevia(arg0, arg1, arg2);
  }
  
  public java.lang.String[] listarCategorias() throws java.rmi.RemoteException{
    if (controladorCursoPublish == null)
      _initControladorCursoPublishProxy();
    return controladorCursoPublish.listarCategorias();
  }
  
  public java.lang.String[] listarDocentes(java.lang.String arg0) throws java.rmi.RemoteException{
    if (controladorCursoPublish == null)
      _initControladorCursoPublishProxy();
    return controladorCursoPublish.listarDocentes(arg0);
  }
  
  public java.lang.String[] listarEdicionesCurso(java.lang.String arg0, java.lang.String arg1) throws java.rmi.RemoteException{
    if (controladorCursoPublish == null)
      _initControladorCursoPublishProxy();
    return controladorCursoPublish.listarEdicionesCurso(arg0, arg1);
  }
  
  public void agregarCursoProgFormacion(java.lang.String arg0, java.lang.String arg1) throws java.rmi.RemoteException, publicadores.ProgramaCursoRepetido_Exception{
    if (controladorCursoPublish == null)
      _initControladorCursoPublishProxy();
    controladorCursoPublish.agregarCursoProgFormacion(arg0, arg1);
  }
  
  public void inscripcionaEdiciondeCurso(java.lang.String arg0, java.util.Calendar arg1, java.lang.String arg2, java.lang.String arg3, java.lang.String arg4, java.lang.String arg5) throws java.rmi.RemoteException, publicadores.InscripcionRepetida_Exception{
    if (controladorCursoPublish == null)
      _initControladorCursoPublishProxy();
    controladorCursoPublish.inscripcionaEdiciondeCurso(arg0, arg1, arg2, arg3, arg4, arg5);
  }
  
  public void inscripcionaProgramaFormacion(java.util.Calendar arg0, java.lang.String arg1, java.lang.String arg2) throws java.rmi.RemoteException, publicadores.InscripcionRepetidaPF_Exception{
    if (controladorCursoPublish == null)
      _initControladorCursoPublishProxy();
    controladorCursoPublish.inscripcionaProgramaFormacion(arg0, arg1, arg2);
  }
  
  public java.lang.String[] listarProgFormacion() throws java.rmi.RemoteException{
    if (controladorCursoPublish == null)
      _initControladorCursoPublishProxy();
    return controladorCursoPublish.listarProgFormacion();
  }
  
  public java.lang.String[] listarEstudiantes() throws java.rmi.RemoteException{
    if (controladorCursoPublish == null)
      _initControladorCursoPublishProxy();
    return controladorCursoPublish.listarEstudiantes();
  }
  
  public java.lang.String[] listarInstitutoCursos() throws java.rmi.RemoteException{
    if (controladorCursoPublish == null)
      _initControladorCursoPublishProxy();
    return controladorCursoPublish.listarInstitutoCursos();
  }
  
  public void altaCategoria(java.lang.String arg0) throws java.rmi.RemoteException, publicadores.CategoriaRepetida_Exception{
    if (controladorCursoPublish == null)
      _initControladorCursoPublishProxy();
    controladorCursoPublish.altaCategoria(arg0);
  }
  
  
}