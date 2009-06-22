package Chado::Schema::Sequence::Featureloc;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("featureloc");
__PACKAGE__->add_columns(
  "featureloc_id",
  {
    data_type => "integer",
    default_value => "nextval('featureloc_featureloc_id_seq'::regclass)",
    is_nullable => 0,
    size => 4,
  },
  "feature_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "srcfeature_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "fmin",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "is_fmin_partial",
  {
    data_type => "boolean",
    default_value => "false",
    is_nullable => 0,
    size => 1,
  },
  "fmax",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "is_fmax_partial",
  {
    data_type => "boolean",
    default_value => "false",
    is_nullable => 0,
    size => 1,
  },
  "strand",
  {
    data_type => "smallint",
    default_value => undef,
    is_nullable => 1,
    size => 2,
  },
  "phase",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "residue_info",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "locgroup",
  { data_type => "integer", default_value => 0, is_nullable => 0, size => 4 },
  "rank",
  { data_type => "integer", default_value => 0, is_nullable => 0, size => 4 },
);
__PACKAGE__->set_primary_key("featureloc_id");
__PACKAGE__->add_unique_constraint("featureloc_c1", ["feature_id", "locgroup", "rank"]);
__PACKAGE__->add_unique_constraint("featureloc_pkey", ["featureloc_id"]);
__PACKAGE__->belongs_to(
  "feature_id",
  "Chado::Schema::Sequence::Feature",
  { feature_id => "feature_id" },
);
__PACKAGE__->belongs_to(
  "srcfeature_id",
  "Chado::Schema::Sequence::Feature",
  { feature_id => "srcfeature_id" },
);
__PACKAGE__->has_many(
  "featureloc_pubs",
  "Chado::Schema::Sequence::FeaturelocPub",
  { "foreign.featureloc_id" => "self.featureloc_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-06-20 19:31:19
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:vlSn/qW9n6FoZc1wjvaDfQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;