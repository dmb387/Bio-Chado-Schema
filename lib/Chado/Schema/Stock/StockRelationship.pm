package Chado::Schema::Stock::StockRelationship;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("stock_relationship");
__PACKAGE__->add_columns(
  "stock_relationship_id",
  {
    data_type => "integer",
    default_value => "nextval('stock_relationship_stock_relationship_id_seq'::regclass)",
    is_nullable => 0,
    size => 4,
  },
  "subject_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "object_id",
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
__PACKAGE__->set_primary_key("stock_relationship_id");
__PACKAGE__->add_unique_constraint("stock_relationship_pkey", ["stock_relationship_id"]);
__PACKAGE__->add_unique_constraint(
  "stock_relationship_c1",
  ["subject_id", "object_id", "type_id", "rank"],
);
__PACKAGE__->belongs_to(
  "subject_id",
  "Chado::Schema::Stock::Stock",
  { stock_id => "subject_id" },
);
__PACKAGE__->belongs_to(
  "object_id",
  "Chado::Schema::Stock::Stock",
  { stock_id => "object_id" },
);
__PACKAGE__->has_many(
  "stock_relationship_pubs",
  "Chado::Schema::Stock::StockRelationshipPub",
  { "foreign.stock_relationship_id" => "self.stock_relationship_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-06-20 19:31:22
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:1LIGW2DxD9JD5JAxSs9ZPQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;