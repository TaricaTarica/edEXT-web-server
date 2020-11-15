/**
 * Curso.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package publicadores;

public class Curso  implements java.io.Serializable {
    private int cantCreditos;

    private int cantHoras;

    private java.lang.String descripcion;

    private java.lang.String duracion;

    private publicadores.LocalDate fechaAlta;

    private java.lang.String img;

    private java.lang.String instituto;

    private java.lang.String nombre;

    private java.lang.String url;

    public Curso() {
    }

    public Curso(
           int cantCreditos,
           int cantHoras,
           java.lang.String descripcion,
           java.lang.String duracion,
           publicadores.LocalDate fechaAlta,
           java.lang.String img,
           java.lang.String instituto,
           java.lang.String nombre,
           java.lang.String url) {
           this.cantCreditos = cantCreditos;
           this.cantHoras = cantHoras;
           this.descripcion = descripcion;
           this.duracion = duracion;
           this.fechaAlta = fechaAlta;
           this.img = img;
           this.instituto = instituto;
           this.nombre = nombre;
           this.url = url;
    }


    /**
     * Gets the cantCreditos value for this Curso.
     * 
     * @return cantCreditos
     */
    public int getCantCreditos() {
        return cantCreditos;
    }


    /**
     * Sets the cantCreditos value for this Curso.
     * 
     * @param cantCreditos
     */
    public void setCantCreditos(int cantCreditos) {
        this.cantCreditos = cantCreditos;
    }


    /**
     * Gets the cantHoras value for this Curso.
     * 
     * @return cantHoras
     */
    public int getCantHoras() {
        return cantHoras;
    }


    /**
     * Sets the cantHoras value for this Curso.
     * 
     * @param cantHoras
     */
    public void setCantHoras(int cantHoras) {
        this.cantHoras = cantHoras;
    }


    /**
     * Gets the descripcion value for this Curso.
     * 
     * @return descripcion
     */
    public java.lang.String getDescripcion() {
        return descripcion;
    }


    /**
     * Sets the descripcion value for this Curso.
     * 
     * @param descripcion
     */
    public void setDescripcion(java.lang.String descripcion) {
        this.descripcion = descripcion;
    }


    /**
     * Gets the duracion value for this Curso.
     * 
     * @return duracion
     */
    public java.lang.String getDuracion() {
        return duracion;
    }


    /**
     * Sets the duracion value for this Curso.
     * 
     * @param duracion
     */
    public void setDuracion(java.lang.String duracion) {
        this.duracion = duracion;
    }


    /**
     * Gets the fechaAlta value for this Curso.
     * 
     * @return fechaAlta
     */
    public publicadores.LocalDate getFechaAlta() {
        return fechaAlta;
    }


    /**
     * Sets the fechaAlta value for this Curso.
     * 
     * @param fechaAlta
     */
    public void setFechaAlta(publicadores.LocalDate fechaAlta) {
        this.fechaAlta = fechaAlta;
    }


    /**
     * Gets the img value for this Curso.
     * 
     * @return img
     */
    public java.lang.String getImg() {
        return img;
    }


    /**
     * Sets the img value for this Curso.
     * 
     * @param img
     */
    public void setImg(java.lang.String img) {
        this.img = img;
    }


    /**
     * Gets the instituto value for this Curso.
     * 
     * @return instituto
     */
    public java.lang.String getInstituto() {
        return instituto;
    }


    /**
     * Sets the instituto value for this Curso.
     * 
     * @param instituto
     */
    public void setInstituto(java.lang.String instituto) {
        this.instituto = instituto;
    }


    /**
     * Gets the nombre value for this Curso.
     * 
     * @return nombre
     */
    public java.lang.String getNombre() {
        return nombre;
    }


    /**
     * Sets the nombre value for this Curso.
     * 
     * @param nombre
     */
    public void setNombre(java.lang.String nombre) {
        this.nombre = nombre;
    }


    /**
     * Gets the url value for this Curso.
     * 
     * @return url
     */
    public java.lang.String getUrl() {
        return url;
    }


    /**
     * Sets the url value for this Curso.
     * 
     * @param url
     */
    public void setUrl(java.lang.String url) {
        this.url = url;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof Curso)) return false;
        Curso other = (Curso) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true && 
            this.cantCreditos == other.getCantCreditos() &&
            this.cantHoras == other.getCantHoras() &&
            ((this.descripcion==null && other.getDescripcion()==null) || 
             (this.descripcion!=null &&
              this.descripcion.equals(other.getDescripcion()))) &&
            ((this.duracion==null && other.getDuracion()==null) || 
             (this.duracion!=null &&
              this.duracion.equals(other.getDuracion()))) &&
            ((this.fechaAlta==null && other.getFechaAlta()==null) || 
             (this.fechaAlta!=null &&
              this.fechaAlta.equals(other.getFechaAlta()))) &&
            ((this.img==null && other.getImg()==null) || 
             (this.img!=null &&
              this.img.equals(other.getImg()))) &&
            ((this.instituto==null && other.getInstituto()==null) || 
             (this.instituto!=null &&
              this.instituto.equals(other.getInstituto()))) &&
            ((this.nombre==null && other.getNombre()==null) || 
             (this.nombre!=null &&
              this.nombre.equals(other.getNombre()))) &&
            ((this.url==null && other.getUrl()==null) || 
             (this.url!=null &&
              this.url.equals(other.getUrl())));
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
        _hashCode += getCantCreditos();
        _hashCode += getCantHoras();
        if (getDescripcion() != null) {
            _hashCode += getDescripcion().hashCode();
        }
        if (getDuracion() != null) {
            _hashCode += getDuracion().hashCode();
        }
        if (getFechaAlta() != null) {
            _hashCode += getFechaAlta().hashCode();
        }
        if (getImg() != null) {
            _hashCode += getImg().hashCode();
        }
        if (getInstituto() != null) {
            _hashCode += getInstituto().hashCode();
        }
        if (getNombre() != null) {
            _hashCode += getNombre().hashCode();
        }
        if (getUrl() != null) {
            _hashCode += getUrl().hashCode();
        }
        __hashCodeCalc = false;
        return _hashCode;
    }

    // Type metadata
    private static org.apache.axis.description.TypeDesc typeDesc =
        new org.apache.axis.description.TypeDesc(Curso.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://publicadores/", "curso"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("cantCreditos");
        elemField.setXmlName(new javax.xml.namespace.QName("", "cantCreditos"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "int"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("cantHoras");
        elemField.setXmlName(new javax.xml.namespace.QName("", "cantHoras"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "int"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("descripcion");
        elemField.setXmlName(new javax.xml.namespace.QName("", "descripcion"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("duracion");
        elemField.setXmlName(new javax.xml.namespace.QName("", "duracion"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("fechaAlta");
        elemField.setXmlName(new javax.xml.namespace.QName("", "fechaAlta"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://publicadores/", "localDate"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("img");
        elemField.setXmlName(new javax.xml.namespace.QName("", "img"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("instituto");
        elemField.setXmlName(new javax.xml.namespace.QName("", "instituto"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
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
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("url");
        elemField.setXmlName(new javax.xml.namespace.QName("", "url"));
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
