class Playwrights
  attr_accessor :title, :year, :playwright_id

  def self.all
    data = PlayDBConnection.instance.execute(<<-SQL)
      SELECT
        *
      FROM
        playwrights
    SQL
    data.map { |each_data| Playwrights.new(each_data) }
  end

  def find_by_name(name)
      data = PlayDBConnections.instance(<<-SQL, name)
        SELECT
          name
        FROM
          Playwrights
        WHERE
          playwrights.name = ?
    SQL
  end
end
