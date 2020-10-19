using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace FSWD_JobBoard.DATA.EF//Metadata
{
    #region Applications
    public class ApplicationsMetadata
    {
        public int ApplicationID { get; set; }
        public int OpenPositionID { get; set; }
        public string UserID { get; set; }
        public System.DateTime ApplicationDate { get; set; }
        public string ManagerNotes { get; set; }
        public int ApplicationStatus { get; set; }
        public string ResumeFilename { get; set; }
    }

    [MetadataType(typeof(ApplicationsMetadata))]
    public partial class Application
    {

    }
    #endregion

    #region Application Status
    public class ApplicationStatusMetadata
    {
        //public int ApplicationStatusID { get; set; }

        [Required(ErrorMessage = "* Status name is required. *")]
        [StringLength(50, ErrorMessage = "* Value must be 50 characters or less. *")]
        [Display(Name = "Status")]
        public string StatusName { get; set; }

        [StringLength(250, ErrorMessage = "* Value must be 250 characters or less. *")]
        [Display(Name = "Description")]
        [DisplayFormat(NullDisplayText = "No description provided."/*, DataFormatString = "{0:d}"*/)]
        public string StatusDescription { get; set; }
    }

    [MetadataType(typeof(ApplicationStatusMetadata))]
    public partial class ApplicationStatus
    {

    }
    #endregion

    #region Locations
    public class LocationsMetadata
    {
        //public int LocationID { get; set; }

        [Required(ErrorMessage = "* Store number is required. *")]
        [StringLength(10, ErrorMessage = "* Value must be 10 characters or less. *")]
        [Display(Name = "Store Number")]
        public string StoreNumber { get; set; }

        [StringLength(50, ErrorMessage = "* Value must be 50 characters or less. *")]
        [Display(Name = "City")]
        [DisplayFormat(NullDisplayText = "No city provided.")]
        public string City { get; set; }

        [Required(ErrorMessage = "* State is required. *")]
        [StringLength(2, ErrorMessage = "* Value must be 2 characters. *")]
        [Display(Name = "State")]
        public string State { get; set; }

        //public string ManagerID { get; set; }
    }

    [MetadataType(typeof(LocationsMetadata))]
    public partial class Location
    {

    }
    #endregion

    #region OpenPositions
    public class OpenPositionsMetadata
    {

        public int OpenPositionID { get; set; }


        public int PositionID { get; set; }


        public int LocationID { get; set; }
    }

    [MetadataType(typeof(OpenPositionsMetadata))]
    public partial class OpenPosition
    {

    }
    #endregion

    #region Positions
    public class PositionsMetadata
    {
        //public int PositionID { get; set; }

        [Required(ErrorMessage = "* Job Title is required. *")]
        [StringLength(50, ErrorMessage = "* Value must be 50 characters or less. *")]
        [Display(Name = "Job Title")]
        public string Title { get; set; }

        [Display(Name = "Job Description")]
        [DisplayFormat(NullDisplayText = "No job description provided.")]
        public string JobDescription { get; set; }
    }

    [MetadataType(typeof(PositionsMetadata))]
    public partial class Position
    {

    }
    #endregion

    #region User Details
    public class UserDetailsMetadata
    {
        //public string UserID { get; set; }

        [Required(ErrorMessage = "* First name is required. *")]
        [StringLength(50, ErrorMessage = "* Value must be 50 characters or less. *")]
        [Display(Name = "First Name")]
        public string FirstName { get; set; }

        [Required(ErrorMessage = "* Last name is required. *")]
        [StringLength(50, ErrorMessage = "* Value must be 50 characters or less. *")]
        [Display(Name = "Last Name")]
        public string LastName { get; set; }

        [StringLength(75, ErrorMessage = "* Value must be 50 characters or less. *")]
        [Display(Name = "Resume File Name")]
        public string ResumeFilename { get; set; }
    }

    [MetadataType(typeof(UserDetailsMetadata))]
    public partial class UserDetail
    {

    }
    #endregion
}
