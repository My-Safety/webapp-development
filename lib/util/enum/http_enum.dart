// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Suresh M, 11/11/2025

enum HttpMethodEnum {
  get(id: 1, methodName: 'GET'),
  post(id: 2, methodName: 'POST'),
  put(id: 3, methodName: 'PUT'),
  delete(id: 4, methodName: 'DELETE');

  const HttpMethodEnum({required this.id, required this.methodName});

  final String methodName;
  final int id;
}
