/**
 * DtInscripcionEd.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package publicadores;

public class DtInscripcionEd  implements java.io.Serializable {
    private java.lang.String nombreEdicion;

    private java.lang.String nicknameEstudiante;

    private java.util.Calendar fecha;

    private publicadores.EstadoInscripcion estado;

    public DtInscripcionEd() {
    }

    public DtInscripcionEd(
           java.lang.String nombreEdicion,
           java.lang.String nicknameEstudiante,
           java.util.Calendar fecha,
           publicadores.EstadoInscripcion estado) {
           this.nombreEdicion = nombreEdicion;
           this.nicknameEstudiante = nicknameEstudiante;
           this.fecha = fecha;
           this.estado = estado;
    }


    /**
     * Gets the nombreEdicion value for this DtInscripcionEd.
     * 
     * @return nombreEdicion
     */
    public java.lang.String getNombreEdicion() {
        return nombreEdicion;
    }


    /**
     * Sets the nombreEdicion value for this DtInscripcionEd.
     * 
     * @param nombreEdicion
     */
    public void setNombreEdicion(java.lang.String nombreEdicion) {
        this.nombreEdicion = nombreEdicion;
    }


    /**
     * Gets the nicknameEstudiante value for this DtInscripcionEd.
     * 
     * @return nicknameEstudiante
     */
    public java.lang.String getNicknameEstudiante() {
        return nicknameEstudiante;
    }


    /**
     * Sets the nicknameEstudiante value for this DtInscripcionEd.
     * 
     * @param nicknameEstudiante
     */
    public void setNicknameEstudiante(java.lang.String nicknameEstudiante) {
        this.nicknameEstudiante = nicknameEstudiante;
    }


    /**
     * Gets the fecha value for this DtInscripcionEd.
     * 
     * @return fecha
     */
    public java.util.Calendar getFecha() {
        return fecha;
    }


    /**
     * Sets the fecha value for this DtInscripcionEd.
     * 
     * @param fecha
     */
    public void setFecha(java.util.Calendar fecha) {
        this.fecha = fecha;
    }


    /**
     * Gets the estado value for this DtInscripcionEd.
     * 
     * @return estado
     */
    public publicadores.EstadoInscripcion getEstado() {
        return estado;
    }


    /**
     * Sets the estado value for this DtInscripcionEd.
     * 
     * @param estado
     */
    public void setEstado(publicadores.EstadoInscripcion estado) {
        this.estado = estado;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof DtInscripcionEd)) return false;
        DtInscripcionEd other = (DtInscripcionEd) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true && 
            ((this.nombreEdicion==null && other.getNombreEdicion()==null) || 
             (this.nombreEdicion!=null &&
              this.nombreEdicion.equals(other.getNombreEdicion()))) &&
            ((this.nicknameEstudiante==null && other.getNicknameEstudiante()==null) || 
             (this.nicknameEstudiante!=null &&
              this.nicknameEstudiante.equals(other.getNicknameEstudiante()))) &&
            ((this.fecha==null && other.getFecha()==null) || 
             (this.fecha!=null &&
              this.fecha.equals(other.getFecha()))) &&
            ((this.estado==null && other.getEstado()==null) || 
             (this.estado!=null &&
              this.estado.equals(other.getEstado())));
        __equalsCalc = null;
        return _equals;
    }

    private boolean __hashCodeCalc = false;
    public synchronized int hashCode() {
        if (__hashCodeCalc) {
            return 0;
        }
        __hashCodeCalc = true;
        int _hashCode = 1;
        if (getNombreEdicion() != null) {
            _hashCode += getNombreEdicion().hashCode();
        }
        if (getNicknameEstudiante() != null) {
            _hashCode += getNicknameEstudiante().hashCode();
        }
        if (getFecha() != null) {
            _hashCode += getFecha().hashCode();
        }
        if (getEstado() != null) {
            _hashCode += getEstado().hashCode();
        }
        __hashCodeCalc = false;
        return _hashCode;
    }

    // Type metadata
    private static org.apache.axis.description.TypeDesc typeDesc =
        new org.apache.axis.description.TypeDesc(DtInscripcionEd.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://publicadores/", "dtInscripcionEd"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("nombreEdicion");
        elemField.setXmlName(new javax.xml.namespace.QName("", "nombreEdicion"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("nicknameEstudiante");
        elemField.setXmlName(new javax.xml.namespace.QName("", "nicknameEstudiante"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("fecha");
        elemField.setXmlName(new javax.xml.namespace.QName("", "fecha"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "dateTime"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("estado");
        elemField.setXmlName(new javax.xml.namespace.QName("", "estado"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://publicadores/", "estadoInscripcion"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
    }

    /**
     * Return type metadata object
     */
    public static org.apache.axis.description.TypeDesc getTypeDesc() {
        return typeDesc;
    }

    /**
     * Get Custom Serializer
     */
    public static org.apache.axis.encoding.Serializer getSerializer(
           java.lang.String mechType, 
           java.lang.Class _javaType,  
           javax.xml.namespace.QName _xmlType) {
        return 
          new  org.apache.axis.encoding.ser.BeanSerializer(
            _javaType, _xmlType, typeDesc);
    }

    /**
     * Get Custom Deserializer
     */
    public static org.apache.axis.encoding.Deserializer getDeserializer(
           java.lang.String mechType, 
           java.lang.Class _javaType,  
           javax.xml.namespace.QName _xmlType) {
        return 
          new  org.apache.axis.encoding.ser.BeanDeserializer(
            _javaType, _xmlType, typeDesc);
    }

}
