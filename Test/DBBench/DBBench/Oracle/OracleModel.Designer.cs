﻿//------------------------------------------------------------------------------
// This is auto-generated code.
//------------------------------------------------------------------------------
// This code was generated by Entity Developer tool using NHibernate template.
// Code is generated on: 07/10/2020 14:07:58
//
// Changes to this file may cause incorrect behavior and will be lost if
// the code is regenerated.
//------------------------------------------------------------------------------

using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;

namespace DBBench.Oracle
{

    /// <summary>
    /// There are no comments for DBBench.Oracle.OraTestTable, DBBench in the schema.
    /// </summary>
    public partial class OraTestTable {

        #region Extensibility Method Definitions

        /// <summary>
        /// There are no comments for OnCreated in the schema.
        /// </summary>
        partial void OnCreated();

        #endregion
        /// <summary>
        /// There are no comments for OraTestTable constructor in the schema.
        /// </summary>
        public OraTestTable()
        {
            OnCreated();
        }

    
        /// <summary>
        /// There are no comments for OraId in the schema.
        /// </summary>
        public virtual decimal OraId
        {
            get;
            set;
        }

    
        /// <summary>
        /// There are no comments for OraStringField in the schema.
        /// </summary>
        public virtual string OraStringField
        {
            get;
            set;
        }
    }

}