module OrdersHelper
  def stat_by(start_date, end_date)
    start_date ||= 1.month.ago
    end_date ||= Time.current
    line_chart by_day_api_item_click_tracks_path(@orders, start_date: start_date, end_date: end_date),
                   basic_opts('Click count', start_date, end_date)
  end

  private

  # The l method is an alias for the localize that formats the timestamp.
  # There is no format called :medium by default

  def basic_opts(title, start_date, end_date)
    {
      discrete: true,
      library: {
        title: {text: title, x: -20},
        subtitle: {text: "from #{l(start_date, format: :medium)} to #{l(end_date, format: :medium)}", x: -20},
        yAxis: {
          title: {
            text: 'Count'
          }
        },
        tooltip: {
          valueSuffix: 'revenue'
        },
        credits: {
          enabled: false
        }
      }
    }
  end
end
