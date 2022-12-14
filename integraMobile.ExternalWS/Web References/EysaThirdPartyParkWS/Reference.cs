//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

// 
// This source code was auto-generated by Microsoft.VSDesigner, Version 4.0.30319.42000.
// 
#pragma warning disable 1591

namespace integraMobile.ExternalWS.EysaThirdPartyParkWS {
    using System;
    using System.Web.Services;
    using System.Diagnostics;
    using System.Web.Services.Protocols;
    using System.Xml.Serialization;
    using System.ComponentModel;
    
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.8.3752.0")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Web.Services.WebServiceBindingAttribute(Name="TarifasSoap", Namespace="http://tempuri.org/")]
    public partial class Tarifas : System.Web.Services.Protocols.SoapHttpClientProtocol {
        
        private ConsolaSoapHeader consolaSoapHeaderValueField;
        
        private System.Threading.SendOrPostCallback rdPQueryTariffOperationCompleted;
        
        private System.Threading.SendOrPostCallback rdPQueryParkingOperationWithTimeStepsOperationCompleted;
        
        private bool useDefaultCredentialsSetExplicitly;
        
        /// <remarks/>
        public Tarifas() {
            this.Url = global::integraMobile.ExternalWS.Properties.Settings.Default.integraMobile_ExternalWS_EysaThirdPartyParkWS_Tarifas;
            if ((this.IsLocalFileSystemWebService(this.Url) == true)) {
                this.UseDefaultCredentials = true;
                this.useDefaultCredentialsSetExplicitly = false;
            }
            else {
                this.useDefaultCredentialsSetExplicitly = true;
            }
        }
        
        public ConsolaSoapHeader ConsolaSoapHeaderValue {
            get {
                return this.consolaSoapHeaderValueField;
            }
            set {
                this.consolaSoapHeaderValueField = value;
            }
        }
        
        public new string Url {
            get {
                return base.Url;
            }
            set {
                if ((((this.IsLocalFileSystemWebService(base.Url) == true) 
                            && (this.useDefaultCredentialsSetExplicitly == false)) 
                            && (this.IsLocalFileSystemWebService(value) == false))) {
                    base.UseDefaultCredentials = false;
                }
                base.Url = value;
            }
        }
        
        public new bool UseDefaultCredentials {
            get {
                return base.UseDefaultCredentials;
            }
            set {
                base.UseDefaultCredentials = value;
                this.useDefaultCredentialsSetExplicitly = true;
            }
        }
        
        /// <remarks/>
        public event rdPQueryTariffCompletedEventHandler rdPQueryTariffCompleted;
        
        /// <remarks/>
        public event rdPQueryParkingOperationWithTimeStepsCompletedEventHandler rdPQueryParkingOperationWithTimeStepsCompleted;
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapHeaderAttribute("ConsolaSoapHeaderValue")]
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/rdPQueryTariff", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public string rdPQueryTariff(int idContrata) {
            object[] results = this.Invoke("rdPQueryTariff", new object[] {
                        idContrata});
            return ((string)(results[0]));
        }
        
        /// <remarks/>
        public void rdPQueryTariffAsync(int idContrata) {
            this.rdPQueryTariffAsync(idContrata, null);
        }
        
        /// <remarks/>
        public void rdPQueryTariffAsync(int idContrata, object userState) {
            if ((this.rdPQueryTariffOperationCompleted == null)) {
                this.rdPQueryTariffOperationCompleted = new System.Threading.SendOrPostCallback(this.OnrdPQueryTariffOperationCompleted);
            }
            this.InvokeAsync("rdPQueryTariff", new object[] {
                        idContrata}, this.rdPQueryTariffOperationCompleted, userState);
        }
        
        private void OnrdPQueryTariffOperationCompleted(object arg) {
            if ((this.rdPQueryTariffCompleted != null)) {
                System.Web.Services.Protocols.InvokeCompletedEventArgs invokeArgs = ((System.Web.Services.Protocols.InvokeCompletedEventArgs)(arg));
                this.rdPQueryTariffCompleted(this, new rdPQueryTariffCompletedEventArgs(invokeArgs.Results, invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState));
            }
        }
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapHeaderAttribute("ConsolaSoapHeaderValue")]
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/rdPQueryParkingOperationWithTimeSteps", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public string rdPQueryParkingOperationWithTimeSteps(string xmlIn) {
            object[] results = this.Invoke("rdPQueryParkingOperationWithTimeSteps", new object[] {
                        xmlIn});
            return ((string)(results[0]));
        }
        
        /// <remarks/>
        public void rdPQueryParkingOperationWithTimeStepsAsync(string xmlIn) {
            this.rdPQueryParkingOperationWithTimeStepsAsync(xmlIn, null);
        }
        
        /// <remarks/>
        public void rdPQueryParkingOperationWithTimeStepsAsync(string xmlIn, object userState) {
            if ((this.rdPQueryParkingOperationWithTimeStepsOperationCompleted == null)) {
                this.rdPQueryParkingOperationWithTimeStepsOperationCompleted = new System.Threading.SendOrPostCallback(this.OnrdPQueryParkingOperationWithTimeStepsOperationCompleted);
            }
            this.InvokeAsync("rdPQueryParkingOperationWithTimeSteps", new object[] {
                        xmlIn}, this.rdPQueryParkingOperationWithTimeStepsOperationCompleted, userState);
        }
        
        private void OnrdPQueryParkingOperationWithTimeStepsOperationCompleted(object arg) {
            if ((this.rdPQueryParkingOperationWithTimeStepsCompleted != null)) {
                System.Web.Services.Protocols.InvokeCompletedEventArgs invokeArgs = ((System.Web.Services.Protocols.InvokeCompletedEventArgs)(arg));
                this.rdPQueryParkingOperationWithTimeStepsCompleted(this, new rdPQueryParkingOperationWithTimeStepsCompletedEventArgs(invokeArgs.Results, invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState));
            }
        }
        
        /// <remarks/>
        public new void CancelAsync(object userState) {
            base.CancelAsync(userState);
        }
        
        private bool IsLocalFileSystemWebService(string url) {
            if (((url == null) 
                        || (url == string.Empty))) {
                return false;
            }
            System.Uri wsUri = new System.Uri(url);
            if (((wsUri.Port >= 1024) 
                        && (string.Compare(wsUri.Host, "localHost", System.StringComparison.OrdinalIgnoreCase) == 0))) {
                return true;
            }
            return false;
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Xml", "4.8.3752.0")]
    [System.SerializableAttribute()]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(Namespace="http://tempuri.org/")]
    [System.Xml.Serialization.XmlRootAttribute(Namespace="http://tempuri.org/", IsNullable=false)]
    public partial class ConsolaSoapHeader : System.Web.Services.Protocols.SoapHeader {
        
        private int idContrataField;
        
        private System.DateTime localTimeField;
        
        private string nomUsuarioField;
        
        private string numSerieField;
        
        private string idUsuarioField;
        
        private string passwordField;
        
        /// <remarks/>
        public int IdContrata {
            get {
                return this.idContrataField;
            }
            set {
                this.idContrataField = value;
            }
        }
        
        /// <remarks/>
        public System.DateTime LocalTime {
            get {
                return this.localTimeField;
            }
            set {
                this.localTimeField = value;
            }
        }
        
        /// <remarks/>
        public string NomUsuario {
            get {
                return this.nomUsuarioField;
            }
            set {
                this.nomUsuarioField = value;
            }
        }
        
        /// <remarks/>
        public string NumSerie {
            get {
                return this.numSerieField;
            }
            set {
                this.numSerieField = value;
            }
        }
        
        /// <remarks/>
        public string IdUsuario {
            get {
                return this.idUsuarioField;
            }
            set {
                this.idUsuarioField = value;
            }
        }
        
        /// <remarks/>
        public string Password {
            get {
                return this.passwordField;
            }
            set {
                this.passwordField = value;
            }
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.8.3752.0")]
    public delegate void rdPQueryTariffCompletedEventHandler(object sender, rdPQueryTariffCompletedEventArgs e);
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.8.3752.0")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    public partial class rdPQueryTariffCompletedEventArgs : System.ComponentModel.AsyncCompletedEventArgs {
        
        private object[] results;
        
        internal rdPQueryTariffCompletedEventArgs(object[] results, System.Exception exception, bool cancelled, object userState) : 
                base(exception, cancelled, userState) {
            this.results = results;
        }
        
        /// <remarks/>
        public string Result {
            get {
                this.RaiseExceptionIfNecessary();
                return ((string)(this.results[0]));
            }
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.8.3752.0")]
    public delegate void rdPQueryParkingOperationWithTimeStepsCompletedEventHandler(object sender, rdPQueryParkingOperationWithTimeStepsCompletedEventArgs e);
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.8.3752.0")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    public partial class rdPQueryParkingOperationWithTimeStepsCompletedEventArgs : System.ComponentModel.AsyncCompletedEventArgs {
        
        private object[] results;
        
        internal rdPQueryParkingOperationWithTimeStepsCompletedEventArgs(object[] results, System.Exception exception, bool cancelled, object userState) : 
                base(exception, cancelled, userState) {
            this.results = results;
        }
        
        /// <remarks/>
        public string Result {
            get {
                this.RaiseExceptionIfNecessary();
                return ((string)(this.results[0]));
            }
        }
    }
}

#pragma warning restore 1591