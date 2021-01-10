INSERT INTO Township  (`name`) VALUES ('Yangon');
INSERT INTO Township  (`name`) VALUES ('Mandalay');
INSERT INTO Township  (`name`) VALUES ('Pyin Oo Lwin');

INSERT INTO InterviewType  (`description`) VALUES ('Personal');
INSERT INTO InterviewType  (`description`) VALUES ('Call');
INSERT INTO InterviewType  (`description`) VALUES ('Online');

INSERT INTO AvailabilityType  (`description`) VALUES ('immediately');
INSERT INTO AvailabilityType  (`description`) VALUES ('1 week');
INSERT INTO AvailabilityType  (`description`) VALUES ('2 week');
INSERT INTO AvailabilityType  (`description`) VALUES ('1 or 2 month');

INSERT INTO CandidateJoborderStatus  (`id`,`short_description`) VALUES ('100', 'Added');
INSERT INTO CandidateJoborderStatus  (`id`,`short_description`) VALUES ('200', 'Interview Request');
INSERT INTO CandidateJoborderStatus  (`id`,`short_description`) VALUES ('300', 'Interview Accept');
INSERT INTO CandidateJoborderStatus  (`id`,`short_description`) VALUES ('400', 'Interview Reject');
INSERT INTO CandidateJoborderStatus  (`id`,`short_description`) VALUES ('500', 'First Interview');
INSERT INTO CandidateJoborderStatus  (`id`,`short_description`) VALUES ('600', 'Second Interview');
INSERT INTO CandidateJoborderStatus  (`id`,`short_description`) VALUES ('700', 'Third Interview');
INSERT INTO CandidateJoborderStatus  (`id`,`short_description`) VALUES ('800', 'Offered');
INSERT INTO CandidateJoborderStatus  (`id`,`short_description`) VALUES ('900', 'Placed');
INSERT INTO CandidateJoborderStatus  (`id`,`short_description`) VALUES ('1000', 'Candidate Declined');



INSERT INTO Recruiter (`email`, `name`, `password`, `phone`) VALUES ('virgo@gmail.com', 'Virgo', 'password', '4545454545');
INSERT INTO Recruiter (`email`, `name`, `password`, `phone`) VALUES ('han@gmail.com', 'Han', 'password', '635454555');

INSERT INTO Company (`address`, `email`, `entry_date`, `ishot`, `name`, `ownerName`, `phone1`, `phone2`, `remark`, `website`, `entryBy`, `township_id`) VALUES ('MICT Park', 'company1@gmail.com', '2020-12-10', 'yes', 'Company1', 'CEO1', '567564545', '5446687', 'Remark', 'company1@gmail.com', '1', '1');
INSERT INTO Company (`address`, `email`, `entry_date`, `ishot`, `name`, `ownerName`, `phone1`, `phone2`, `remark`, `website`, `entryBy`, `township_id`) VALUES ('Kyauktada', 'company2@gmail.com', '2020-12-10', 'yes', 'Company2', 'CEO2', '567564545', '5446687', 'Remark', 'company2@gmail.com', '1', '2');

INSERT INTO Candidate (`email`, `entry_date`, `expectedSalary`, `is_active`, `key_skills`, `name`, `phone`, `availiability_id`, `entryBy`, `township_id`,`cv_form`) VALUES ('yibo@gmail.com', '2020-12-10', '500000', 'yes', 'JAVA, PHP', 'Aung Aung', '6545646548', '4', '1', '2','JAVA.pdf');
INSERT INTO Candidate (`email`, `entry_date`, `expectedSalary`, `is_active`, `key_skills`,  `name`, `phone`, `availiability_id`, `entryBy`, `township_id`,`cv_form`) VALUES ('xiaozhan@gmail.com', '2020-12-10', '600000', 'yes', 'MBA', 'Mg Mg', '786768768', '2', '1', '1','MBA.pdf');
INSERT INTO Candidate (`email`, `entry_date`, `expectedSalary`, `is_active`, `key_skills`, `name`, `phone`, `availiability_id`, `entryBy`, `township_id`,`cv_form`) VALUES ('tao@gmail.com', '2020-12-10', '400000', 'yes', 'PHP', 'Mon Mon', '769576878687', '3', '1', '3','PHP.pdf');

INSERT INTO Joborder (`basic_salary`, `entry_date`, `is_active`, `job_description`, `job_position`, `total_employee`, `company`, `entryBy`, `job_location`) VALUES ('500000', '2020-12-10', 'yes', 'Description', 'Backend Developer', '2', '1', '1', '1');
INSERT INTO Joborder (`basic_salary`, `entry_date`, `is_active`, `job_description`, `job_position`, `total_employee`, `company`, `entryBy`, `job_location`) VALUES ('600000', '2020-12-10', 'yes', 'Description', 'Business Manager', '2', '2', '1', '2');
INSERT INTO Joborder (`basic_salary`, `entry_date`, `is_active`, `job_description`, `job_position`, `total_employee`, `company`, `entryBy`, `job_location`) VALUES ('400000', '2020-12-10', 'yes', 'Description', 'Full Stack Developer', '3', '1', '1', '1');



INSERT INTO Candidate_job_order (`entry_date`, `candidate_id`, `candidatejoborderstatus_id`, `entryBy`, `joborder_id`) VALUES ('2020-11-24', '1', '100', '1', '1');

INSERT INTO Candidate_job_order (`entry_date`, `candidate_id`, `candidatejoborderstatus_id`, `entryBy`, `joborder_id`) VALUES ('2020-11-24', '2', '100', '2', '1');
INSERT INTO Candidate_job_order (`entry_date`, `candidate_id`, `candidatejoborderstatus_id`, `entryBy`, `joborder_id`) VALUES ('2020-11-25', '2', '100', '1', '3');
INSERT INTO Candidate_job_order (`entry_date`, `candidate_id`, `candidatejoborderstatus_id`, `entryBy`, `joborder_id`) VALUES ('2020-11-24', '1', '100', '2', '2');
INSERT INTO Candidate_job_order (`entry_date`, `candidate_id`, `candidatejoborderstatus_id`, `entryBy`, `joborder_id`) VALUES ('2020-11-26', '3', '100', '1', '1');

DROP TRIGGER IF EXISTS change_pipeline_status_history; 
CREATE TRIGGER change_pipeline_status_history AFTER UPDATE ON candidate_job_order FOR EACH ROW BEGIN IF NEW.candidatejoborderstatus_id != OLD.candidatejoborderstatus_id THEN INSERT INTO pipelinehistory(piplelineId,fromstatus,tostatus,actionUserId,actionDate) VALUES(NEW.id,OLD.candidatejoborderstatus_id,NEW.candidatejoborderstatus_id,NEW.modifyBy,NEW.modify_date); END IF; END