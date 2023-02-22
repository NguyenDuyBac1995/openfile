import 'package:flutter/material.dart';

class Phone{
  String name;
  String phone;
  String group;
  String date;
  Phone({required this.name, required this.phone, required this.group, required this.date});
}

List<Phone> dummyData = [
  Phone(name:'hnh mac qey 123', phone: '028389111555', group: 'FE CREDIT', date: '2023-01-31'),
  Phone(name:'bnh Dat',phone: '1900988954', group: 'Robocash', date: '2023-01-29'),
  Phone(name:'cnh Long',phone: '19001066', group: 'EASY CREDIT', date: '2023-01-28'),
  Phone(name:'Dnh lol',phone: '18006388', group: 'F88', date: '2023-01-31'),
  Phone(name:'enh Me',phone: '02422200588', group: 'BIDV', date: '2023-01-31'),
  Phone(name:'Anh Bac',phone: '1900969610', group: 'DOctordong', date: '2023-01-31'),
  Phone(name:'Anh Bac',phone: '1900636072', group: 'Findo', date: '2023-01-31'),
  Phone(name:'Anh Bac',phone: '1800888882', group: 'Vamo', date: '2023-01-31'),
  Phone(name:'Anh Bac',phone: '190063336', group: 'FE CREDIT', date: '2023-01-31'),
  Phone(name:'Anh Bac',phone: '190063335', group: 'vamo', date: '2023-01-31'),
  Phone(name:'Anh Bac',phone: '1900633482', group: 'viaconto', date: '2023-01-31'),
];




// void data(){
//   List<Map<String,dynamic>> dummnyData = [
//     {
//       "userId": 1,
//       "id": 1,
//       'name':'anh BAC DEP Trai',
//       "phonenumber" : "02839111554",
//       "group": "FE CREDIT",
//       "date": "2023-01-31"
//     },
//     {
//       "userId": 1,
//       "id": 2,
//       'name':'a minh',
//       "phonenumber": "1900988954",
//       "group": "Robocash",
//       "date": "2023-01-31"
//     },
//     {
//       "userId": 1,
//       "id": 3,
//       'name':'chi cuc',
//       "phonenumber": "19001066",
//       "group": "EASY CREDIT",
//       "date": "2023-01-31"
//     },
//     {
//       "userId": 1,
//       "id": 4,
//       'name':'phuong Hoi',
//       "phonenumber": "18006388",
//       "group": "F88",
//       "date": "2023-01-31"
//     },
//     {
//       "userId": 1,
//       "id": 5,
//       'name':'tuan Anh',
//       "phonenumber": "02422200588",
//       "group": "BIDV",
//       "date": "2023-01-31"
//     },
//     {
//       "userId": 1,
//       "id": 6,
//       'name':'long Lan',
//       "phonenumber": "1900969610",
//       "group": "DOctordong",
//       "date": "2023-01-31"
//     },
//     {
//       "userId": 1,
//       "id": 7,
//       'name':'duc Phuc',
//       "phonenumber": "1900636072",
//       "group": "Findo",
//       "date": "2023-01-31"
//     },
//     {
//       "userId": 1,
//       "id": 8,
//       'name':'hoi Bick',
//       "phonenumber": "1800888882",
//       "group": "Vamo",
//       "date": "2023-01-31"
//     },
//     {
//       "userId": 1,
//       "id": 9,
//       'name':'eny OL',
//       "phonenumber": "190063336",
//       "group": "FE CREDIT",
//       "date": "2023-01-31"
//     },
//     {
//       "userId": 1,
//       "id": 11,
//       'name':'Ghe the nhi',
//       "phonenumber": "02839111555",
//       "group": "FE CREDIT",
//       "date": "2023-01-31"
//     },
//     {
//       "userId": 1,
//       "id": 12,
//       'name':'hoang dao thuy',
//       "phonenumber": "02839111556",
//       "group": "FE CREDIT",
//       "date": "2023-01-31"
//     },
//     {
//       "userId": 1,
//       "id": 13,
//       'name':'ke me tao',
//       "phonenumber": "02839111557",
//       "group": "FE CREDIT",
//       "date": "2023-01-31"
//     },
//     {
//       "userId": 1,
//       "id": 14,
//       'name':'Ok May Cunwg',
//       "phonenumber": "02839111558",
//       "group": "FE CREDIT",
//       "date": "2023-01-31"
//     },
//   ];
//
//   )
// }