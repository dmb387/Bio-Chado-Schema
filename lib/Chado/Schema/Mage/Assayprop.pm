package Chado::Schema::Mage::Assayprop;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("assayprop");
__PACKAGE__->add_columns(
  "assayprop_id",
  {
    data_type => "integer",
    default_value => "nextval('assayprop_assayprop_id_seq'::regclass)",
    is_nullable => 0,
    size => 4,
  },
  "assay_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "type_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "value",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "rank",
  { data_type => "integer", default_value => 0, is_nullable => 0, size => 4 },
);
__PACKAGE__->set_primary_key("assayprop_id");
__PACKAGE__->add_unique_constraint("assayprop_pkey", ["assayprop_id"]);
__PACKAGE__->add_unique_constraint("assayprop_c1", ["assay_id", "type_id", "rank"]);
__PACKAGE__->belongs_to(
  "assay_id",
  "Chado::Schema::Mage::Assay",
  { assay_id => "assay_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-06-20 19:31:25
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:pDTdEmsmY3Sa4G89wGBwsA


# You can replace this text with custom content, and it will be preserved on regeneration
1;