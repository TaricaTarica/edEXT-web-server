/**
 * Edicion.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package publicadores;

public class Edicion  implements java.io.Serializable {
    private int cupo;

    private publicadores.LocalDate fechaFin;

    private publicadores.LocalDate fechaIni;

    private publicadores.LocalDate fechaPub;

    private java.lang.String nombre;

    public Edicion() {
    }

    public Edicion(
           int cupo,
           publicadores.LocalDate fechaFin,
           publicadores.LocalDate fechaIni,
           publicadores.LocalDate fechaPub,
           java.lang.String nombre) {
           this.cupo = cupo;
           this.fechaFin = fechaFin;
           this.fechaIni = fechaIni;
           this.fechaPub = fechaPub;
           this.nombre = nombre;
    }


    /**
     * Gets the cupo value for this Edicion.
     * 
     * @return cupo
     */
    public int getCupo() {
        return cupo;
    }


    /**
     * Sets the cupo value for this Edicion.
     * 
     * @param cupo
     */
    public void setCupo(int cupo) {
        this.cupo = cupo;
    }


    /**
     * Gets the fechaFin value for this Edicion.
     * 
     * @return fechaFin
     */
    public publicadores.LocalDate getFechaFin() {
        return fechaFin;
    }


    /**
     * Sets the fechaFin value for this Edicion.
     * 
     * @param fechaFin
     */
    public void setFechaFin(publicadores.LocalDate fechaFin) {
        this.fechaFin = fechaFin;
    }


    /**
     * Gets the fechaIni value for this Edicion.
     * 
     * @return fechaIni
     */
    public publicadores.LocalDate getFechaIni() {
        return fechaIni;
    }


    /**
     * Sets the fechaIni value for this Edicion.
     * 
     * @param fechaIni
     */
    public void setFechaIni(publicadores.LocalDate fechaIni) {
        this.fechaIni = fechaIni;
    }


    /**
     * Gets the fechaPub value for this Edicion.
     * 
     * @return fechaPub
     */
    public publicadores.LocalDate getFechaPub() {
        return fechaPub;
    }


    /**
     * Sets the fechaPub value for this Edicion.
     * 
     * @param fechaPub
     */
    public void setFechaPub(publicadores.LocalDate fechaPub) {
        this.fechaPub = fechaPub;
    }


    /**
     * Gets the nombre value for this Edicion.
     * 
     * @return nombre
     */
    public java.lang.String getNombre() {
        return nombre;
    }


    /**
     * Sets the nombre value for this Edicion.
     * 
     * @param nombre
     */
    public void setNombre(java.lang.String nombre) {
        this.nombre = nombre;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof Edicion)) return false;
        Edicion other = (Edicion) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true && 
            this.cupo == other.getCupo() &&
            ((this.fechaFin==null && other.getFechaFin()==null) || 
             (this.fechaFin!=null &&
              this.fechaFin.equals(other.getFechaFin()))) &&
            ((this.fechaIni==null && other.getFechaIni()==null) || 
             (this.fechaIni!=null &&
              this.fechaIni.equals(other.getFechaIni()))) &&
            ((this.fechaPub==null && other.getFechaPub()==null) || 
             (this.fechaPub!=null &&
              this.fechaPub.equals(other.getFechaPub()))) &&
            ((this.nombre==null && other.getNombre()==null) || 
             (this.nombre!=null &&
              this.nombre.equals(other.getNombre())));
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
        _hashCode += getCupo();
        if (getFechaFin() != null) {
            _hashCode += getFechaFin().hashCode();
        }
        if (getFechaIni() != null) {
            _hashCode += getFechaIni().hashCode();
        }
        if (getFechaPub() != null) {
            _hashCode += getFechaPub().hashCode();
        }
        if (getNombre() != null) {
            _hashCode += getNombre().hashCode();
        }
        __hashCodeCalc = false;
        return _hashCode;
    }

    // Type metadata
    private static org.apache.axis.description.TypeDesc typeDesc =
        new org.apache.axis.description.TypeDesc(Edicion.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://publicadores/", "edicion"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("cupo");
        elemField.setXmlName(new javax.xml.namespace.QName("", "cupo"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "int"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("fechaFin");
        elemField.setXmlName(new javax.xml.namespace.QName("", "fechaFin"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://publicadores/", "localDate"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("fechaIni");
        elemField.setXmlName(new javax.xml.namespace.QName("", "fechaIni"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://publicadores/", "localDate"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("fechaPub");
        elemField.setXmlName(new javax.xml.namespace.QName("", "fechaPub"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://publicadores/", "localDate"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("nombre");
        elemField.setXmlName(new javax.xml.namespace.QName("", "nombre"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
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
