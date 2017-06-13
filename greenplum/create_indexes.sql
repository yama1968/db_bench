
drop index if exists idx_did;
drop index if exists idx_dip;
drop index if exists idx_aid;

create index idx_did on Train (device_id);
create index idx_dip on Train (device_ip);
create index idx_aip on Train (app_id);
