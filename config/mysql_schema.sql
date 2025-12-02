CREATE DATABASE IF NOT EXISTS project_db;
USE project_db;

CREATE TABLE IF NOT EXISTS job (
    job_id INT NOT NULL,
    company_id INT,
    group_id INT,
    campaign_id INT,
    PRIMARY KEY (job_id)
);

CREATE TABLE IF NOT EXISTS master_publisher (
    id INT NOT NULL,
    created_by VARCHAR(100) CHARACTER SET utf8mb3,
    created_date TIMESTAMP,
    last_modified_by VARCHAR(100) CHARACTER SET utf8mb3,
    last_modified_date TIMESTAMP,
    is_active TINYINT(1),
    publisher_name VARCHAR(100) CHARACTER SET utf8mb3,
    email VARCHAR(100) CHARACTER SET utf8mb3,
    access_token VARCHAR(255) CHARACTER SET utf8mb3,
    publisher_type INT,
    publisher_status TINYINT(1),
    publisher_frequency INT,
    curency INT,
    time_zone VARCHAR(100) CHARACTER SET utf8mb3,
    cpc_increment INT,
    bid_reading INT,
    min_bid INT,
    max_bid INT,
    countries VARCHAR(100) CHARACTER SET utf8mb3,
    data_sharing VARCHAR(255) CHARACTER SET utf8mb3,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS events (
    id INT AUTO_INCREMENT,
    job_id INT,
    dates TEXT,
    hours INT,
    disqualified_application INT,
    qualified_application INT,
    conversion INT,
    company_id INT,
    group_id INT,
    campaign_id INT,
    publisher_id INT,
    bid_set DOUBLE,
    clicks INT,
    spend_hour DOUBLE,
    sources VARCHAR(100) DEFAULT 'Cassandra',
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    CONSTRAINT fk_events_job FOREIGN KEY (job_id) REFERENCES job(job_id) ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT fk_events_publisher FOREIGN KEY (publisher_id) REFERENCES master_publisher(id) ON DELETE SET NULL ON UPDATE CASCADE
);