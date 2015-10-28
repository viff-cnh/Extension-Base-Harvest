using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using Landis.Library.Metadata;
using Landis.Core;

namespace Landis.Extension.BaseHarvest
{
    public class EventsLog
    {

        [DataFieldAttribute(Unit = FieldUnits.Year, Desc = "Harvest Year")]
        public int Time {set; get;}

        [DataFieldAttribute(Desc = "Management Area")]
        public uint ManagementArea { set; get; }

        [DataFieldAttribute(Desc = "Prescription Name")]
        public string Prescription { set; get; }

        [DataFieldAttribute(Desc = "Stand Map Code")]
        public uint StandMapCode { set; get; }

        [DataFieldAttribute(Desc = "Event ID")]
        public int EventID { set; get; }

        [DataFieldAttribute(Unit = FieldUnits.Year, Desc = "Stand Age")]
        public int StandAge { set; get; }

        [DataFieldAttribute(Desc = "Stand Rank", Format = "0.0")]
        public double StandRank { set; get; }

        [DataFieldAttribute(Unit = FieldUnits.Count, Desc = "Stand Site Count")]
        public int StandSiteCount { set; get; }

        [DataFieldAttribute(Unit = FieldUnits.Count, Desc = "Number of Sites Harvested")]
        public int HarvestedSites { set; get; }

        //[DataFieldAttribute(Unit = FieldUnits.Mg_ha, Desc = "Biomass Removed (Mg)", Format = "0.00")]
        //public double MgBiomassRemoved { set; get; }

        //[DataFieldAttribute(Unit = FieldUnits.Mg_ha, Desc = "Biomass Removed (Mg) per damaged hectare", Format = "0.00")]
        //public double MgBioRemovedPerDamagedHa { set; get; }

        //[DataFieldAttribute(Unit = FieldUnits.Count, Desc = "Number of Cohorts Partially Harvested")]
        //public int CohortsHarvestedPartial { set; get; }

        [DataFieldAttribute(Unit = FieldUnits.Count, Desc = "Number of Cohorts Completely Harvested")]
        public int CohortsHarvestedComplete { set; get; }

        [DataFieldAttribute(Unit = FieldUnits.Count, Desc = "Species Cohorts Harvested by Species", SppList = true)]
        public double[] CohortsHarvested_ { set; get; }

 
    }
}
