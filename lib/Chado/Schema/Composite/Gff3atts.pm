package Chado::Schema::Composite::Gff3atts;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("gff3atts");
__PACKAGE__->add_columns(
  "feature_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "type",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "attribute",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-06-20 19:31:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:TOP9e/+WNfl6TZcaZVUAMg


# You can replace this text with custom content, and it will be preserved on regeneration
1;