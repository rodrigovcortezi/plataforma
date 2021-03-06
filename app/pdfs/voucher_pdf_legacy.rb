require 'prawn/qrcode'
require 'prawn/table'

class VoucherPdfLegacy
  include Prawn::View

  def initialize(ticket_token)
    @ticket = ticket_token
    font_setup
    content
  end

  def font_setup
    font_families.update("Inter" => {
      :normal => "#{Rails.root}/app/frontend/assets/fonts/Inter-Regular.ttf",
      :italic => "#{Rails.root}/app/frontend/assets/fonts/Inter-Italic.ttf",
      :bold => "#{Rails.root}/app/frontend/assets/fonts/Inter-Bold.ttf"
    })
    font "Inter"
  end

  def content
    move_down 30
    span(400, :position => :center) do
      svg IO.read("#{Rails.root}/app/frontend/assets/images/logo.svg"), width: 130
      move_down 8
      text "<color rgb='a6a6a6'>INGRESSO DO PEDIDO ##{@ticket.order.number}</color>", inline_format: true

      move_down 30
      bounding_box([0, cursor], width: 200, height: 150) do
        print_qr_code(@ticket.code, extent: 144, stroke: false, align: :left)
      end

      owner_details = [
        ["Evento",           "#{@ticket.event.name}"],
        ["Data",         "#{@ticket.event.start_t.strftime("%d/%m/%Y - %Hh")}"],
        ["Participante", "#{@ticket.owner_name}"],
        ["Email", "#{@ticket.owner_email}"],
        ["Tipo de ingresso",        "#{@ticket.offer.name}"]
      ]
      bounding_box([170, cursor+135], width: 200, height: 150) do
        table(owner_details, width: 230, cell_style: { border_color: 'cccccc', border_lines: [:dashed], border_width: 0.4, size: 9.5 }, column_widths: [100, 130], row_colors: ["FFFFFF", "FAF9F8"]) do
          cells.padding = 6
        end
      end

      move_down 50
      text "<link href='https://partiuingresso.com'>PartiuIngresso.com</link>", inline_format: true, size: 9, style: :bold
      move_down 5
      text "<color rgb='a6a6a6'><link href='https://ajuda.partiuingresso.com'>Precisa de ajuda?</link></color>", inline_format: true, size: 8
      move_down 2
      text "<color rgb='a6a6a6'><link href='https://ajuda.partiuingresso.com'>Acesse ajuda.partiuingresso.com</link></color>", inline_format: true, size: 8
    end
  end

end