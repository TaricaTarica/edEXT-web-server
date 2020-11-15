/**
 * ControladorCursoPublish.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package publicadores;

public interface ControladorCursoPublish extends java.rmi.Remote {
    public publicadores.DtinfoEdicion consultaEdicionCategoria(java.lang.String arg0, java.lang.String arg1, java.lang.String arg2) throws java.rmi.RemoteException;
    public java.lang.String[] listarCursosCategoria(java.lang.String arg0) throws java.rmi.RemoteException;
    public java.lang.String[] listarEstudiantes() throws java.rmi.RemoteException;
    public java.lang.String[] listarProgFormacion() throws java.rmi.RemoteException;
    public java.lang.String[] listarEdicionesCurso(java.lang.String arg0, java.lang.String arg1) throws java.rmi.RemoteException;
    public void agregarCursoProgFormacion(java.lang.String arg0, java.lang.String arg1) throws java.rmi.RemoteException, publicadores.ProgramaCursoRepetido_Exception;
    public void inscripcionaEdiciondeCurso(java.lang.String arg0, java.util.Calendar arg1, java.lang.String arg2, java.lang.String arg3, java.lang.String arg4, java.lang.String arg5) throws java.rmi.RemoteException, publicadores.InscripcionRepetida_Exception;
    public java.lang.String[] listarInstitutoCursos() throws java.rmi.RemoteException;
    public void inscripcionaProgramaFormacion(publicadores.LocalDate arg0, java.lang.String arg1, java.lang.String arg2) throws java.rmi.RemoteException, publicadores.InscripcionRepetidaPF_Exception;
    public java.lang.String[] atributosEdicion(java.lang.String arg0, java.lang.String arg1, java.lang.String arg2) throws java.rmi.RemoteException;
    public java.lang.String[] listarEdiciones(java.lang.String arg0, java.lang.String arg1) throws java.rmi.RemoteException;
    public publicadores.DtCursoInfo consultaCurso(java.lang.String arg0, java.lang.String arg1) throws java.rmi.RemoteException;
    public java.lang.String[] listarCursos(java.lang.String arg0) throws java.rmi.RemoteException;
    public java.lang.String[] listarPrevias(java.lang.String arg0, java.lang.String arg1) throws java.rmi.RemoteException;
    public void altaInstituto(java.lang.String arg0) throws java.rmi.RemoteException, publicadores.InstitutoRepetido_Exception;
    public java.lang.String[] listarInstitutos() throws java.rmi.RemoteException;
    public void agregarCategorias(java.lang.String arg0, java.lang.String arg1, java.lang.String arg2) throws java.rmi.RemoteException;
    public void altadeEdiciondeCurso(publicadores.DtEdicion arg0, java.lang.String arg1, java.lang.String arg2) throws java.rmi.RemoteException, publicadores.EdicionRepatida_Exception;
    public java.lang.String[] listarCategoriasC(java.lang.String arg0, java.lang.String arg1) throws java.rmi.RemoteException;
    public void altaCrearProgramadeFormacion(publicadores.DtProgramaFormacion arg0) throws java.rmi.RemoteException, publicadores.CrearProgramaFormacionRepetido_Exception;
    public java.lang.String[] listarProgramasAux(java.lang.String arg0, java.lang.String arg1) throws java.rmi.RemoteException;
    public java.lang.String[] atributosPrograma(java.lang.String arg0) throws java.rmi.RemoteException;
    public publicadores.DtProgramaFormacion consultaProgramaFormacion(java.lang.String arg0) throws java.rmi.RemoteException;
    public java.lang.String[] listarCursosCategoriasP(java.lang.String arg0) throws java.rmi.RemoteException;
    public java.lang.String[] listarCategorias() throws java.rmi.RemoteException;
    public void agregarPrevia(java.lang.String arg0, java.lang.String arg1, java.lang.String arg2) throws java.rmi.RemoteException;
    public void altaCurso(publicadores.DtCurso arg0, java.lang.String arg1) throws java.rmi.RemoteException, publicadores.CursoRepetido_Exception;
    public java.lang.String[] listarDocentes(java.lang.String arg0) throws java.rmi.RemoteException;
    public void asociarEdicion(java.lang.String arg0, publicadores.DtEdicion arg1, java.lang.String arg2, java.lang.String arg3) throws java.rmi.RemoteException;
    public java.lang.String[] listarCursosP(java.lang.String arg0) throws java.rmi.RemoteException;
    public java.lang.String[] listarProgramas() throws java.rmi.RemoteException;
    public void altaCategoria(java.lang.String arg0) throws java.rmi.RemoteException, publicadores.CategoriaRepetida_Exception;
    public void agregarCursoProgFormacion2(java.lang.String arg0, java.lang.String arg1, java.lang.String arg2) throws java.rmi.RemoteException, publicadores.ProgramaCursoRepetido_Exception;
    public publicadores.DtCursoInfo consultaCursoCategoria(java.lang.String arg0, java.lang.String arg1) throws java.rmi.RemoteException;
    public publicadores.DtinfoEdicion consultaEdicion(java.lang.String arg0, java.lang.String arg1, java.lang.String arg2) throws java.rmi.RemoteException;
    public void ingresarPrevia(java.lang.String arg0) throws java.rmi.RemoteException;
    public void ingresarCurso(java.lang.String arg0, java.lang.String arg1, java.lang.String arg2, java.lang.String arg3, int arg4, int arg5, java.util.Calendar arg6, java.lang.String arg7) throws java.rmi.RemoteException;
    public publicadores.DtCurso[] busquedaCurso(java.lang.String arg0) throws java.rmi.RemoteException;
    public java.lang.String obtenerInstitutoCursoPrograma(java.lang.String arg0, java.lang.String arg1) throws java.rmi.RemoteException;
    public java.lang.String getInstitutoDocente(java.lang.String arg0) throws java.rmi.RemoteException;
    public java.lang.String[] listarEdicionesCategoria(java.lang.String arg0, java.lang.String arg1) throws java.rmi.RemoteException;
    public void seleccionarestadoInscripcion(java.lang.String arg0, java.lang.String arg1, java.lang.String arg2, java.lang.String arg3, java.lang.String arg4) throws java.rmi.RemoteException;
    public java.lang.String obtenerInstitutoCurso(java.lang.String arg0) throws java.rmi.RemoteException;
    public publicadores.DtInscripcionEd[] obtenerInscripcionesEd(java.lang.String arg0, java.lang.String arg1, java.lang.String arg2) throws java.rmi.RemoteException;
}
