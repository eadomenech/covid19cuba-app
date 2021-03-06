// GENERATED CODE - DO NOT MODIFY BY HAND
// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

part of 'changelog_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangelogItem _$ChangelogItemFromJson(Map<String, dynamic> json) {
  return ChangelogItem()
    ..version = json['version'] as String
    ..date = dateTimeFromJson(json['date'] as String)
    ..changed = (json['changed'] as List)?.map((e) => e as String)?.toList()
    ..added = (json['added'] as List)?.map((e) => e as String)?.toList()
    ..fixed = (json['fixed'] as List)?.map((e) => e as String)?.toList()
    ..deleted = (json['deleted'] as List)?.map((e) => e as String)?.toList();
}

Map<String, dynamic> _$ChangelogItemToJson(ChangelogItem instance) =>
    <String, dynamic>{
      'version': instance.version,
      'date': dateTimeToJson(instance.date),
      'changed': instance.changed,
      'added': instance.added,
      'fixed': instance.fixed,
      'deleted': instance.deleted,
    };
