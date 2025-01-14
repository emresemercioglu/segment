{
  version: 1.0,
  label: 'Segment Stripe',
  description: 'It lets you analyze the Stripe data exported via Segment integrations',
  tags: ['finance', 'saas'],
  variables: {
    schema: {
      label: 'Schema',
      type: 'schema',
      options: {
        placeholder: '(ex: stripe)',
      },
    },
  },
  dependencies: {
    dbt: {
      packages: [
        {
          package: 'fivetran/dbt_stripe',
          version: '0.0.1',
        },
      ],
    },
  },
}
