using System;

namespace Azunt.Web.Models
{
    /// <summary>
    /// Devices 
    /// </summary>
    public class Device
    {
        public int Id { get; set; }
        public string? ModelName { get; set; }
        public string? ModelType { get; set; }
        public string? DeviceType { get; set; }
        public string? DeviceId { get; set; }
        public string? Maker { get; set; }
        public string? UserRef { get; set; }
        public long UnitPrice { get; set; }
        public DateTimeOffset CreatedDate { get; set; }
    }
}
