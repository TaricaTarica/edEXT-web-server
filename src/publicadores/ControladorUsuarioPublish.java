/**
 * ControladorUsuarioPublish.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package publicadores;

public interface ControladorUsuarioPublish extends java.rmi.Remote {
    public void confirmarAltaEstudiante(publicadores.DtEstudiante arg0) throws java.rmi.RemoteException, publicadores.UsuarioRepetido_Exception;
    public publicadores.DtUsuario[] obtenerSeguidores(java.lang.String arg0) throws java.rmi.RemoteException;
    public void confirmarAltaDocente(publicadores.DtDocente arg0) throws java.rmi.RemoteException, publicadores.UsuarioRepetido_Exception;
    public java.lang.String[] listarEdicionesEst(java.lang.String arg0) throws java.rmi.RemoteException;
    public publicadores.Instituto getInstituto(java.lang.String arg0) throws java.rmi.RemoteException;
    public java.lang.String getCurso(java.lang.String arg0, publicadores.Curso[] arg1) throws java.rmi.RemoteException;
    public boolean existeUsuario(java.lang.String arg0) throws java.rmi.RemoteException;
    public publicadores.Edicion obtenerEdicion(java.lang.String arg0, java.lang.String arg1) throws java.rmi.RemoteException;
    public void seguirUsuario(java.lang.String arg0, java.lang.String arg1) throws java.rmi.RemoteException;
    public publicadores.DtUsuario[] obtenerSeguidos(java.lang.String arg0) throws java.rmi.RemoteException;
    public boolean esSeguidor(java.lang.String arg0, java.lang.String arg1) throws java.rmi.RemoteException;
    public publicadores.Curso[] getCursos(publicadores.Instituto arg0) throws java.rmi.RemoteException;
    public java.lang.String nombresDocente(publicadores.Edicion arg0) throws java.rmi.RemoteException;
    public void dejarSeguir(java.lang.String arg0, java.lang.String arg1) throws java.rmi.RemoteException;
    public java.lang.String[] atributosEdicion(java.lang.String arg0, java.lang.String arg1) throws java.rmi.RemoteException;
    public void confirmarAlta(publicadores.DtUsuario arg0) throws java.rmi.RemoteException, publicadores.UsuarioRepetido_Exception;
    public java.lang.String[] listarInstitutos() throws java.rmi.RemoteException;
    public void ingresarInstitutoDocente(java.lang.String arg0) throws java.rmi.RemoteException;
    public java.lang.String[] atributosPrograma(java.lang.String arg0) throws java.rmi.RemoteException;
    public java.lang.String[] listarEdicionesD(java.lang.String arg0) throws java.rmi.RemoteException;
    public java.lang.String[] listarEdicionesE(java.lang.String arg0) throws java.rmi.RemoteException;
    public java.lang.String[] listarProgramasE(java.lang.String arg0) throws java.rmi.RemoteException;
    public boolean esEstudiante(java.lang.String arg0) throws java.rmi.RemoteException;
    public publicadores.DtUsuario consultaUsuario(java.lang.String arg0) throws java.rmi.RemoteException;
    public java.lang.String[] listarUsuarios() throws java.rmi.RemoteException;
    public java.lang.String getContraseniaUsuario(java.lang.String arg0) throws java.rmi.RemoteException;
    public java.lang.String getApellidoUsuario(java.lang.String arg0) throws java.rmi.RemoteException;
    public java.lang.String getNombreUsuario(java.lang.String arg0) throws java.rmi.RemoteException;
    public void modificarUsuario(java.lang.String arg0, java.lang.String arg1, java.lang.String arg2, java.util.Calendar arg3, java.lang.String arg4) throws java.rmi.RemoteException;
}
