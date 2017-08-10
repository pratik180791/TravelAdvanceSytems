select * from trvl_Adv_employees_pbt;
select * from trvl_adv_department_pbt;
select * from trvl_adv_proj_pbt;
select * from trvl_adv_events_pbt;
select * from trvl_adv_exp_details_pbt;
select * from trvl_adv_request_pbt;
select * from trvl_adv_Response_pbt;
select * from trvl_adv_travel_Advances_pbt;


select * from trvl_adv_response_pbt;
select * from trvl_adv_Settle_details_pbt;
  
  select emp_Designation from trvl_Adv_employees_pbt where emp_id=(select emp_mgr_id from trvl_Adv_employees_pbt where emp_id=3001)
  select * from trvl_Adv_employees_pbt;
  trvl_adv_proj_pbt;
  trvl_adv_events_pbt;
  
select * from trvl_adv_request_pbt;
  create table trvl_adv_department_pbt
  (Dept_Id number primary key,
  Dept_Name varchar2(30),
  Dept_Loc varchar2(30)
  );
    
  create table trvl_Adv_employees_pbt
  (
  Emp_ID number primary key, 
  Emp_Name varchar2(30), 
  emp_Dept_id number, 
  Emp_designation varchar2(30) not null, 
  Emp_phone number, 
  Emp_Hire_Date date, 
  Emp_Mgr_Id number ,
  constraint fk_dep_id foreign key (emp_Dept_id) references trvl_adv_department_pbt(Dept_id),
  constraint fk_mgr_id foreign key (emp_mgr_id) references  trvl_Adv_employees_pbt(Emp_ID)
  );
  
  create table trvl_adv_proj_pbt
  (
  Proj_ID varchar2(30) primary key, 
  Proj_Name varchar2(255) not null, 
  Proj_Start_Date date, 
  Proj_End_Date date, 
  Proj_Mgr_Id number, 
  Proj_Cost number,
  constraint fk_pmgr_id foreign key (Proj_Mgr_Id) references trvl_Adv_employees_pbt(Emp_ID));
  
  create table trvl_adv_events_pbt(
  Event_Id varchar2(30) primary key, 
  Proj_Id varchar2(30), 
  Event_Desc varchar2(255), 
  Event_loc varchar2(255) not null, 
  Event_start_date date, 
  Event_end_date date, 
  Event_Mgr number,
  constraint fk_proj_id foreign key(Proj_Id) references trvl_adv_proj_pbt(Proj_ID)
  );
  

create table trvl_adv_exp_details_pbt
(Exp_Id varchar2(30) primary key,
Event_Id varchar2(30),
Proj_Id varchar2(30),
Emp_ID number,
Exp_type varchar2(255),
Exp_Cost number,
Exp_desc varchar2(255),
constraint fk_evnt_id foreign key(event_id) references trvl_adv_events_pbt(Event_Id),
constraint fk_proj_id1 foreign key(Proj_Id) references trvl_adv_proj_pbt(Proj_ID),
constraint fk_emp_id1 foreign key (Emp_ID) references trvl_Adv_employees_pbt(Emp_ID)
);
  
create table trvl_adv_request_pbt
(
TA_Request_Id number primary key, 
Requester_ID number, 
Event_Id varchar2(30), 
Proj_ID varchar2(30), 
TA_Remittance_Type varchar2(30) not null, 
Trvl_strt_date date, 
Trvl_end_date date,
TA_Apporval_EMP_ID number,
constraint fk_emp_id2 foreign key (TA_Apporval_EMP_ID) references trvl_Adv_employees_pbt(Emp_ID),
constraint fk_evnt_id1 foreign key(event_id) references trvl_adv_events_pbt(Event_Id),
constraint fk_proj_id2 foreign key(Proj_Id) references trvl_adv_proj_pbt(Proj_ID)
);

create table trvl_adv_travel_Advances_pbt(
TA_Issuance_Id number primary key,
TA_Request_Id number,
Event_Id varchar2(30),
TA_strt_date date,
TA_end_date date,
TA_Remittance_Type varchar2(30), 
TA_Amount number, 
TA_Status varchar2(30), 
Dept_Id number,
constraint fk_dept_id foreign key(dept_Id) references trvl_adv_department_pbt(dept_id),
constraint fk_evnt_id2 foreign key(event_id) references trvl_adv_events_pbt(Event_Id),
constraint ta_req_id foreign key(TA_Request_Id) references trvl_adv_request_pbt(ta_request_id)
);

create table trvl_adv_response_pbt(
TA_RESP_ID number primary key,
Event_Id varchar2(30),
Emp_ID number,
Project_Id varchar2(30),
Total_Expenses number,
Response_Date date,
constraint fk_evnt_id3 foreign key(event_id) references trvl_adv_events_pbt(Event_Id),
constraint fk_emp_id3 foreign key (Emp_ID) references trvl_Adv_employees_pbt(Emp_ID),
constraint fk_proj_id3 foreign key(Project_Id) references trvl_adv_proj_pbt(Proj_ID)
);

create table trvl_adv_Settle_details_pbt
(
Set_ID number,
Set_Event_ID varchar2(30),
Set_issuance_ID number,
Set_Utilization_Type varchar2(30),
Set_total_expenses number,
Set_total_advances number,
Set_Initiated_Date date,
Set_last_modified_Date date,
constraint fk_evnt_id4 foreign key(Set_Event_ID) references trvl_adv_events_pbt(Event_Id),
constraint fk_iss_id foreign key(Set_issuance_ID) references trvl_adv_request_pbt(ta_request_id)
);



select * from trvl_adv_request_pbt