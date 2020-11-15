/**
 * DtDocente.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package publicadores;

public class DtDocente  extends publicadores.DtUsuario  implements java.io.Serializable {
    private publicadores.DtInstituto instituto;

    public DtDocente() {
    }

    public DtDocente(
           java.lang.String nickname,
           java.lang.String nombre,
           java.lang.String apellido,
           java.lang.String correo,
           java.util.Calendar fechaNac,
           java.lang.String contrasenia,
           publicadores.DtInstituto instituto) {
        super(
            nickname,
            nombre,
            apellido,
            correo,
            fechaNac,
            contrasenia);
        this.instituto = instituto;
    }


    /**
     * Gets the instituto value for this DtDocente.
     * 
     * @return instituto
     */
    public publicadores.DtInstituto getInstituto() {
        return instituto;
    }


    /**
     * Sets the instituto value for this DtDocente.
     * 
     * @param instituto
     */
    public void setInstituto(publicadores.DtInstituto instituto) {
        this.instituto = instituto;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof DtDocente)) return false;
        DtDocente other = (DtDocente) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = super.equals(obj) && 
            ((this.instituto==null && other.getInstituto()==null) || 
             (this.instituto!=null &&
              this.instituto.equals(other.getInstituto())));
        __equalsCalc = null;
        return _equals;
    }

    private boolean __hashCodeCalc = false;
    public synchronized int hashCode() {
        if (__hashCodeCalc) {
            return 0;
        }
        __hashCodeCalc = true;
        int _hashCode = super.hashCode();
        if (getInstituto() != null) {
            _hashCode += getInstituto().hashCode();
        }
        __hashCodeCalc = false;
        return _hashCode;
    }

    // Type metadata
    private static org.apache.axis.description.TypeDesc typeDesc =
        new org.apache.axis.description.TypeDesc(DtDocente.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://publicadores/", "dtDocente"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("instituto");
        elemField.setXmlName(new javax.xml.namespace.QName("", "instituto"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://publicadores/", "dtInstituto"));
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
