using Azure.Storage.Blobs;

namespace BilCoAPI.Utility
{
    public class BlobUtility
    {
        public static string ConnectionString { get; set; }
        public static async Task<string> UploadImageAsync(byte[] file)
        {
            var newFileName = String.Concat(Convert.ToString(Guid.NewGuid()), ".jpg");
            var blobServiceClient = new BlobServiceClient(ConnectionString);
            var blobContainerClient = blobServiceClient.GetBlobContainerClient("images");
            // Create a blob client and upload the file
            var blobClient = blobContainerClient.GetBlobClient(newFileName);
            using (var stream = new MemoryStream(file))
            {
                await blobClient.UploadAsync(stream, true);
            }
            // Return the URL of the uploaded file
            return blobClient.Uri.ToString();
        }

        // delete image by url
        public static async Task DeleteImageAsync(string fileUrl)
        {
            var blobServiceClient = new BlobServiceClient(ConnectionString);
            var blobContainerClient = blobServiceClient.GetBlobContainerClient("images");
            // Create a blob client and upload the file
            var blobClient = blobContainerClient.GetBlobClient(fileUrl);
            await blobClient.DeleteIfExistsAsync();
        }
    }
}
