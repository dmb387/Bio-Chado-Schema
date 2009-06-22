package Chado::Schema::Map::Featurepos;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("featurepos");
__PACKAGE__->add_columns(
  "featurepos_id",
  {
    data_type => "integer",
    default_value => "nextval('featurepos_featurepos_id_seq'::regclass)",
    is_nullable => 0,
    size => 4,
  },
  "featuremap_id",
  {
    data_type => "integer",
    default_value => "nextval('featurepos_featuremap_id_seq'::regclass)",
    is_nullable => 0,
    size => 4,
  },
  "feature_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "map_feature_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "mappos",
  {
    data_type => "double precision",
    default_value => undef,
    is_nullable => 0,
    size => 8,
  },
);
__PACKAGE__->set_primary_key("featurepos_id");
__PACKAGE__->add_unique_constraint("featurepos_pkey", ["featurepos_id"]);
__PACKAGE__->belongs_to(
  "featuremap_id",
  "Chado::Schema::Map::Featuremap",
  { featuremap_id => "featuremap_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-06-20 19:31:27
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:3LMvp10HGbZOiVUYHG1FiQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;