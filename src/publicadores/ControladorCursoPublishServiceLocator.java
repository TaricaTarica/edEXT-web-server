/**
 * ControladorCursoPublishServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package publicadores;

public class ControladorCursoPublishServiceLocator extends org.apache.axis.client.Service implements publicadores.ControladorCursoPublishService {

    public ControladorCursoPublishServiceLocator() {
    }


    public ControladorCursoPublishServiceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public ControladorCursoPublishServiceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for ControladorCursoPublishPort
    private java.lang.String ControladorCursoPublishPort_address = "http://localhost:1942/controladorCurso";

    public java.lang.String getControladorCursoPublishPortAddress() {
        return ControladorCursoPublishPort_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String ControladorCursoPublishPortWSDDServiceName = "ControladorCursoPublishPort";

    public java.lang.String getControladorCursoPublishPortWSDDServiceName() {
        return ControladorCursoPublishPortWSDDServiceName;
    }

    public void setControladorCursoPublishPortWSDDServiceName(java.lang.String name) {
        ControladorCursoPublishPortWSDDServiceName = name;
    }

    public publicadores.ControladorCursoPublish getControladorCursoPublishPort() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(ControladorCursoPublishPort_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getControladorCursoPublishPort(endpoint);
    }

    public publicadores.ControladorCursoPublish getControladorCursoPublishPort(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            publicadores.ControladorCursoPublishPortBindingStub _stub = new publicadores.ControladorCursoPublishPortBindingStub(portAddress, this);
            _stub.setPortName(getControladorCursoPublishPortWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setControladorCursoPublishPortEndpointAddress(java.lang.String address) {
        ControladorCursoPublishPort_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (publicadores.ControladorCursoPublish.class.isAssignableFrom(serviceEndpointInterface)) {
                publicadores.ControladorCursoPublishPortBindingStub _stub = new publicadores.ControladorCursoPublishPortBindingStub(new java.net.URL(ControladorCursoPublishPort_address), this);
                _stub.setPortName(getControladorCursoPublishPortWSDDServiceName());
                return _stub;
            }
        }
        catch (java.lang.Throwable t) {
            throw new javax.xml.rpc.ServiceException(t);
        }
        throw new javax.xml.rpc.ServiceException("There is no stub implementation for the interface:  " + (serviceEndpointInterface == null ? "null" : serviceEndpointInterface.getName()));
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(javax.xml.namespace.QName portName, Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        if (portName == null) {
            return getPort(serviceEndpointInterface);
        }
        java.lang.String inputPortName = portName.getLocalPart();
        if ("ControladorCursoPublishPort".equals(inputPortName)) {
            return getControladorCursoPublishPort();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("http://publicadores/", "ControladorCursoPublishService");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("http://publicadores/", "ControladorCursoPublishPort"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("ControladorCursoPublishPort".equals(portName)) {
            setControladorCursoPublishPortEndpointAddress(address);
        }
        else 
{ // Unknown Port Name
            throw new javax.xml.rpc.ServiceException(" Cannot set Endpoint Address for Unknown Port" + portName);
        }
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(javax.xml.namespace.QName portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        setEndpointAddress(portName.getLocalPart(), address);
    }

}
