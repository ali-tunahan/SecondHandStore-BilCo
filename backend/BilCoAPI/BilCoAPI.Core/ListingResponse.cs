using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BilCoAPI.Core
{
    public class ListingResponse<TData>
    {
        public IEnumerable<TData> Data { get; set; }
        public int TotalCount { get; set; }
        public int? StartIndex { get; set; }
        public int DataCount { get; set; }
    }
}
