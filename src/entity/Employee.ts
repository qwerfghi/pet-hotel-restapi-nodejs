import {Column, Entity, PrimaryGeneratedColumn} from "typeorm";

@Entity("staff")
export class Employee {

    @Column({name: "idstaff"})
    @PrimaryGeneratedColumn()
    id: number;

    @Column({name: "employee_name"})
    employeeName: string;

    @Column({name: "employee_last_name"})
    employeeLastName: string;

    @Column({name: "employee_patronymic"})
    employeePatronymic: string;

    @Column({name: "date_rec"})
    dateRec: string;

    @Column({name: "passport"})
    passport: string;

    @Column({name: "phone_num"})
    phoneNum: string;

    @Column({name: "email"})
    email: string;

    @Column({name: "position"})
    position: string;

}