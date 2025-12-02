CREATE KEYSPACE IF NOT EXISTS cassandra_data 
WITH REPLICATION = {'class': 'SimpleStrategy', 'replication_factor': 1};

USE cassandra_data;

CREATE TABLE IF NOT EXISTS tracking (
    create_time timeuuid PRIMARY KEY,
    job_id int,
    custom_track text,
    bid float,
    campaign_id int,
    group_id int,
    publisher_id int,
    ts timestamp,
    bn text, cd int, de text, dl text, dt text, ed text, ev int, 
    id text, md text, rl text, sr text, tz int, ua text, uid text,
    utm_campaign text, utm_content text, utm_medium text, utm_source text, utm_term text,
    v int, vp text
);

CREATE INDEX ON tracking (ts);