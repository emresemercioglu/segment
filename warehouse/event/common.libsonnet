{
  mappings: {
    eventTimestamp: 'received_at',
    incremental: 'timestamp',
    userId: 'user_id',
  },
  relations: {
    segment_users: {
      relationship: 'manyToOne',
      type: 'leftJoin',
      source: 'user_id',
      target: 'user_id',
    },
  },
  measures: {
    total_events: {
      aggregation: 'count',
    },
    unique_users: {
      aggregation: 'countUnique',
      column: 'user_id',
    },
  } + if std.objectHas({}, 'context_app_version') then {
    context_app_version: {
      label: 'Last Seen App Version',
      description: 'It helps you to identify deprecated events',
      sql: 'max({{TABLE}}.context_app_version order by {{TABLE}}.received_at desc)',
      type: 'string',
    },
  } else {},
  dimensions: {
    id: {
      description: 'An ID attached to the event at execution time and used for deduplication at the server level.',
      column: 'id',
      type: 'string',
    },
    sent_at: {
      description: 'The UTC timestamp set by library when the Segment API call was sent. This timestamp can be affected by device clock skew.',
      column: 'sent_at',
      type: 'timestamp',
    },
    anonymous_id: {
      description: 'The anonymous ID of the user',
      category: 'Event',
      type: 'string',
      column: 'anonymous_id',
    },
    context_library_name: {
      label: 'Segment Library Name',
      category: 'Event',
      type: 'string',
      column: 'context_library_name',
    },
    context_library_version: {
      label: 'Segment Library Version',
      category: 'Event',
      type: 'string',
      column: 'context_library_version',
    },
    original_timestamp: {
      description: 'The original timestamp set by the Segment library at the time the event is created. Keep in mind, this timestamp can be affected by device clock skew.',
      category: 'Event',
      type: 'timestamp',
      column: 'original_timestamp',
    },
    received_at: {
      description: 'The UTC timestamp set by the Segment API when the API receives the payload from client or server.',
      category: 'Event',
      type: 'timestamp',
      column: 'received_at',
    },
    timestamp: {
      description: 'UTC-converted timestamp which is set by the Segment library.',
      category: 'Event',
      type: 'timestamp',
      column: 'timestamp',
    },
    user_id: {
      category: 'Event',
      type: 'string',
      column: 'user_id',
    },
  },
}