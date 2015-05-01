require "table_flip/version"

class TableFlip
  OVERRIDE_FLAG = "WIPE_DB_YES_I_REALLY_REALLY_KNOW_WHAT_IM_DOING"

  class DBNotEmptyError < StandardError
  end

  def initialize(db)
    @db = db
  end

  def check!
    return if ENV[OVERRIDE_FLAG] == "true"
    ❨╯°□°❩╯︵┻━┻ if non_empty_tables.any?
  end

  private

  def ❨╯°□°❩╯︵┻━┻
    if non_empty_tables.count == 1
      table = "table"
      is_are = "is"
    else
      table = "tables"
      is_are = "are"
    end

    raise DBNotEmptyError, "The #{table} #{non_empty_table_names} #{is_are} not " \
                           "empty! Running this command would wipe the database, " \
                           "if you're sure you want this, run " \
                           "`#{OVERRIDE_FLAG}=true YOUR_COMMAND`"
  end

  def non_empty_table_names
    non_empty_tables.map { |table| "'#{table.to_s}'"}.join(', ')
  end

  def non_empty_tables
    @non_empty_tables ||= tables.select { |table| @db[table].count > 0 }
  end

  def tables
    Sequel::Model.db.tables.reject { |name| name == :schema_migrations }
  end
end
