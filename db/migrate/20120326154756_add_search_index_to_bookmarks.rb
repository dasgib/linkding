class AddSearchIndexToBookmarks < ActiveRecord::Migration
  def up
    execute <<-EOS
      CREATE FUNCTION array_to_tsvector(regconfig, varchar[]) RETURNS tsvector AS $$
        SELECT to_tsvector($1, array_to_string($2, ' '));
      $$ LANGUAGE SQL IMMUTABLE;
    EOS

    execute <<-EOS
      CREATE INDEX bookmarks_search_idx ON bookmarks
      USING gin((
        to_tsvector('english', title)
        || to_tsvector('english', coalesce(description, ''))
        || array_to_tsvector('english', tag_array)));
    EOS
  end

  def down
    execute "DROP INDEX bookmarks_search_idx"
    execute "DROP FUNCTION array_to_tsvector(regconfig, varchar[])"
  end
end
