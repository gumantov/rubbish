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



  def trees_cut
    mails_qty = Mail.count
    trees = (mails_qty / 2).floor
    return trees
  end


  def chart_company_name_carbon_waste

    query = 'SELECT COUNT(*) AS count_all, mails.size, companies.name
    FROM mails
    INNER JOIN companies ON (
      companies.id = mails.company_id
    )
    GROUP BY mails.company_id, mails.size;'

    data = {}

    Mail.connection.select_all(query).rows.each {|row|
      data[row[1]] ||= []
      water = row[0]*16
      data[row[1]] << [row[2], water]

    }

    mails = data.keys.map {|name|
      {
        name: name,
        data: data[name]
      }
    }

  column_chart mails, height: '500px', library: {
      title: {text: 'Water Used to Create the Letters ', x: -20},
      yAxis: {
          allowDecimals: false,
          title: {
              text: 'Every single sheet paper equals 16oz of water'
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
