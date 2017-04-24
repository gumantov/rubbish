module MailsHelper

  def chart_stacked_company_name
    sql = 'SELECT COUNT(*) AS count_all, mails.size, companies.name
    FROM mails
    INNER JOIN companies ON (
      companies.id = mails.company_id
    )
    GROUP BY mails.company_id, mails.size;'

    data = {}

    Mail.connection.select_all(sql).rows.each {|row|
      data[row[1]] ||= []
      data[row[1]] << [row[2], row[0]]
    }

    mails = data.keys.map {|name|
      {
        name: name,
        data: data[name]
      }
    }

  column_chart mails, stacked: true, height: '500px', library: {
      title: {text: 'Mails per Company', x: -20},
      yAxis: {
          allowDecimals: false,
          title: {
              text: 'Count'
          }
      },
      xAxis: {
          title: {
              text: 'Company Name'
          }
      }
  }
  end

end
