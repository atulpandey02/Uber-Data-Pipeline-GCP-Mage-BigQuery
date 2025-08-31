# Uber Data Engineering Pipeline

A modern end-to-end data engineering project that processes NYC Uber trip data using cloud-native tools and best practices. This pipeline demonstrates dimensional modeling, ETL orchestration with Mage AI, and analytics-ready data warehouse implementation.

## 🏗️ Architecture Overview

```
Raw Data (CSV) → Mage AI (ETL) → BigQuery (Data Warehouse) → Looker (Analytics)
     ↓              ↓                    ↓                        ↓
Google Cloud    Compute Engine     Dimensional Model        Dashboards
  Storage      Orchestration        Fact & Dimension           & Reports
```

## 🛠️ Tech Stack

- **Orchestration**: Mage AI - Modern data pipeline orchestration platform
- **Cloud Platform**: Google Cloud Platform (GCP)
- **Compute**: Google Compute Engine
- **Data Warehouse**: Google BigQuery
- **Analytics**: Google Looker Studio
- **Programming**: Python, SQL
- **Libraries**: Pandas, Google Cloud SDK

## 📊 Data Model

### Fact Table
- **fact_table**: Central table containing trip metrics and foreign keys to dimension tables

### Dimension Tables
- **datetime_dim**: Time-based attributes (pickup/dropoff times, hour, day, month, year, weekday)
- **passenger_count_dim**: Number of passengers per trip
- **trip_distance_dim**: Distance traveled for each trip
- **rate_code_dim**: Rate code types (Standard, JFK, Newark, Nassau/Westchester, Negotiated, Group)
- **pickup_location_dim**: Pickup coordinates (latitude, longitude)
- **dropoff_location_dim**: Dropoff coordinates (latitude, longitude)
- **payment_type_dim**: Payment methods (Credit Card, Cash, No Charge, Dispute, Unknown, Voided)

## 🚀 Getting Started

### Prerequisites
- Google Cloud Platform account
- Google Compute Engine instance
- Python 3.x installed

### Installation

1. **Set up the environment** (run commands from `commands.txt`):
```bash
# Update system packages
sudo apt-get update

# Install Python dependencies
sudo apt-get install python3-distutils python3-apt wget

# Install pip
wget https://bootstrap.pypa.io/get-pip.py
sudo python3 get-pip.py

# Install required packages
sudo pip3 install mage-ai pandas google-cloud google-cloud-bigquery
```

2. **Launch Mage AI**:
```bash
mage start uber_data_pipeline
```

3. **Access the Mage UI** at `http://your-instance-ip:6789`

## 🔄 Pipeline Workflow

### 1. Data Extraction
- Fetches Uber trip data from Google Cloud Storage
- Source: `https://storage.googleapis.com/uber-data-engineering-project/uber_data.csv`
- Loads 100,000+ trip records

### 2. Data Transformation
The transformation process creates a star schema:

```python
# Key transformations include:
- Date/time parsing and feature extraction
- Duplicate removal and data cleaning
- Dimensional table creation
- Foreign key mapping
- Data type optimization
```

### 3. Data Loading
- Exports transformed data to BigQuery
- Creates fact and dimension tables
- Implements proper indexing and partitioning

### 4. Analytics Layer
- Creates analytics table joining all dimensions
- Optimized for reporting and dashboard queries
- Ready for Looker Studio integration

## 📈 Key Features

- **Scalable Architecture**: Cloud-native design handles large datasets
- **Modern Orchestration**: Mage AI provides intuitive pipeline management
- **Dimensional Modeling**: Star schema optimized for analytics
- **Data Quality**: Automated duplicate detection and data validation
- **Cost Efficient**: Serverless BigQuery scales with usage

## 🔍 Sample Analytics Queries

The final analytics table enables complex business intelligence queries:

```sql
-- Average trip distance by payment type
SELECT 
    payment_type_name,
    AVG(trip_distance) as avg_distance
FROM `project.dataset.tbl_analytics`
GROUP BY payment_type_name;

-- Peak hours analysis
SELECT 
    EXTRACT(HOUR FROM tpep_pickup_datetime) as hour,
    COUNT(*) as trip_count,
    AVG(total_amount) as avg_fare
FROM `project.dataset.tbl_analytics`
GROUP BY hour
ORDER BY trip_count DESC;
```

## 📂 Project Structure

```
uber-data-pipeline/
├── commands.txt                 # Environment setup commands
├── Uber Data Pipeline.ipynb     # Data transformation notebook
├── analytics_query.sql          # Analytics table creation
├── Uber_tbl_analytics.sql      # Final analytics query
└── mage_pipelines/             # Mage AI pipeline files
    ├── data_loaders/
    ├── transformers/
    └── data_exporters/
```

## 🎯 Business Value

This pipeline enables data-driven insights for:
- **Revenue Optimization**: Analyze fare patterns and pricing strategies
- **Operational Efficiency**: Identify peak hours and demand patterns
- **Geographic Analysis**: Understand pickup/dropoff hotspots
- **Customer Behavior**: Payment preferences and trip characteristics

## 🚀 Future Enhancements

- Real-time streaming data processing
- Machine learning models for demand prediction
- Advanced geospatial analytics
- Automated data quality monitoring
- Cost optimization through data lifecycle management

## 🤝 Contributing

Feel free to fork this project and submit pull requests for improvements. Areas for contribution:
- Additional data sources integration
- Enhanced data quality checks
- Performance optimizations
- Advanced analytics features

## 📄 License

This project is open source and available under the MIT License.

---

**Built with modern data engineering best practices using Mage AI orchestration platform**
