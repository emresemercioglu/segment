{
  version: 1.1,
  label: 'Segment Warehouse',
  description: 'It implements pageview, mobile and event analytics models for Segment Warehouse.',
  image: 'https://github.com/rakam-io/recipes/raw/master/segment/logo.png',
  variables: {
    // event analytics
    tracks_target: {
      label: 'Segment Tracks Table',
      type: 'table',
      default: { table: 'tracks' },
      description: 'The tracks table in your Segment Destination. See: https://segment.com/docs/destinations/#warehouse-schemas',
    },
    event_types: {
      label: 'Event types',
      type: 'multiple-table',
      parent: 'tracks_target',
      description: 'Select the event types that you want to create models from',
      options: {
        exclude: ['aliases', 'groups', 'identifies', 'pages', 'screens', 'tracks'],
      },
    },
    // mobile analytics
    screens_target: {
      label: 'Segment Screens Table',
      required: false,
      type: 'table',
      default: { table: 'screens' },
      description: 'The pages table in your Segment Destination. See: https://segment.com/docs/destinations/#warehouse-schemas',
    },
    screens_event_attributes: {
      label: 'Screen Event attributes',
      required: false,
      parent: 'screens_target',
      type: 'table-multiple-column',
      description: 'Select the attributes that you want to turn into dimensions',
      options: {
        exclude: [
          'context_app_version',
          'context_screen_height',
          'context_os_name',
          'context_app_name',
          'context_app_build',
          'context_timezone',
          'context_library_version',
          'context_device_type',
          'context_network_wifi',
          'context_network_cellular',
          'context_network_carrier',
          'context_library_name',
          'context_device_advertising_id',
          'context_screen_width',
          'context_device_token',
          'context_device_model',
          'context_device_manufacturer',
          'context_device_ad_tracking_enabled',
          'context_app_namespace',
        ],
      },
    },
    // pageview analytics
    pages_target: {
      label: 'Segment Pageview Table',
      type: 'table',
      default: { table: 'pages' },
      description: 'The pages table in your Segment Destination. See: https://segment.com/docs/connections/warehouses/',
    },
    session_model_target: {
      parent: 'pages_target',
      label: 'The target of the sessionization model',
      type: 'target',
      default: { table: 'rakam_segment_web_sessions' },
      description: 'We need to create an incremental model in your warehouse in order the sessionize your pageview table.',
    },
    session_duration_in_minutes: {
      label: 'Session duration',
      parent: 'session_model_target',
      type: 'numeric',
      default: 30,
      description: 'The session duration in minutes',
    },
    // user attribution
    users_target: {
      label: 'Segment User Table',
      type: 'table',
      default: { table: 'users' },
      description: 'The users table in your Segment Destination. See: https://segment.com/docs/destinations/#warehouse-schemas',
    },
    identifies_target: {
      label: 'Segment Identifies Table',
      parent: 'users_target',
      type: 'table',
      default: { table: 'identifies' },
      description: 'The identifies table in your Segment Destination. See: https://segment.com/docs/destinations/#warehouse-schemas',
    },
    attributions: {
      label: 'User properties',
      parent: 'users_target',
      type: 'table-multiple-column',
      description: 'The attributions that will be attached as dimensions to user model',
    },
  },
  tags: ['event-analytics', 'mobile-analytics', 'pageview-analytics', 'attribution'],
}
