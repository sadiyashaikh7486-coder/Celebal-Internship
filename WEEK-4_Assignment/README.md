# Azure Cloud Fundamentals and Data Pipeline Implementation using Azure Data Factory (ADF)

## Project Overview

This project demonstrates the implementation of an end-to-end data pipeline using Microsoft Azure services. The pipeline reads a CSV file from Azure Blob Storage, validates its metadata using the Get Metadata activity, copies the data using Azure Data Factory, and stores the processed file in a destination Blob Storage container.

---

## Project Architecture

```
          Source Blob Storage
             (CSV File)
                  │
                  ▼
        Get Metadata Activity
                  │
                  ▼
         Copy Data Activity
                  │
                  ▼
     Destination Blob Storage
```

---

## Architecture Description

### Source Blob Storage (CSV File)
- Azure Storage Account is used to store the input CSV file.
- The Superstore dataset is uploaded into the source Blob container.
- Azure Data Factory reads the file from this location.

### Get Metadata Activity
- Retrieves metadata of the source file before processing.
- Validates file existence.
- Retrieves properties such as:
  - File Exists
  - File Size
  - Last Modified Date

### Copy Data Activity
- Copies the CSV file from the source Blob container.
- Transfers the data to the destination Blob container.
- Uses Linked Services and Datasets configured in Azure Data Factory.

### Destination Blob Storage
- Stores the copied CSV file.
- Acts as the final output location of the pipeline.

---

## Azure Services Used

- Microsoft Azure Portal
- Azure Resource Group
- Azure Storage Account
- Azure Blob Storage
- Azure Data Factory
- Azure IAM (Access Control)

---

## Project Workflow

1. Login to Azure Portal.
2. Create a Resource Group.
3. Create a Storage Account.
4. Create Blob Containers:
   - input-data
   - output-data
5. Upload the Superstore CSV file.
6. Create Azure Data Factory.
7. Configure Linked Service.
8. Create Source Dataset.
9. Create Destination Dataset.
10. Configure Get Metadata Activity.
11. Configure Copy Data Activity.
12. Execute the Pipeline.
13. Monitor Pipeline Execution.
14. Validate Metadata.
15. Verify copied file in Destination Blob Storage.

---

## Expected Output

- Resource Group created successfully.
- Storage Account created.
- Blob Containers created.
- CSV file uploaded successfully.
- Linked Service configured.
- Source and Destination datasets created.
- Metadata validated successfully.
- Copy Data activity completed successfully.
- Pipeline execution status: **Succeeded**.
- CSV file copied to Destination Blob Storage.

---

## Pipeline Components

| Component | Purpose |
|-----------|---------|
| Source Blob Storage | Stores input CSV file |
| Get Metadata Activity | Validates file metadata |
| Copy Data Activity | Copies data from source to destination |
| Destination Blob Storage | Stores processed CSV file |

---

## Conclusion

This project demonstrates the complete implementation of an Azure Data Factory pipeline for processing files stored in Azure Blob Storage. The pipeline successfully validates the source file metadata and copies the CSV file to a destination container, showcasing the core concepts of Azure cloud storage, data integration, and pipeline orchestration.