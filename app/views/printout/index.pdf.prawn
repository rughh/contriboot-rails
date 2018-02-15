def dl(pdf, title, value, width, height, font_size: 16)
  pdf.bounding_box [0, pdf.cursor + 5], width: width, height: height * 24 + 15 do
    pdf.stroke_bounds
    pdf.move_down 5
    pdf.indent 5 do
      pdf.font 'OpenSans', style: :italic
      pdf.font_size 8
      pdf.text title
    end
    pdf.font 'OpenSans', style: :normal
    pdf.move_down 5
    pdf.font_size font_size
    pdf.indent 5 do
      pdf.text(value || ' ')
    end
  end
end

def render_contribution(pdf, contribution, interest: false)
  pdf.start_new_page
  pdf.font 'OpenSans', style: :normal
  left_width = pdf.bounds.width * 0.75
  right_width = pdf.bounds.width - (left_width)
  if interest
    pdf.float do
      pdf.move_down 10
      pdf.font_size 48
      pdf.text "Idea", color: 'CCCCCC', align: :right
    end
  end
  pdf.move_down 5
  pdf.bounding_box [0, pdf.bounds.height - 5], width: left_width, height: 490 do
    dl(pdf, "Title:", contribution.title, left_width, 2)
    pdf.move_down 10
    if (interest)
      dl(pdf, "Interest By:", contribution.user.try(:name), left_width, 1)
    else
      dl(pdf, "By:", contribution.user.try(:name), left_width, 1)
    end
    pdf.move_down 10
  end
  pdf.bounding_box [left_width + 5, pdf.bounds.height], width: (right_width - 5), height: 107 do
    pdf.stroke_bounds
    pdf.move_down 5
    pdf.indent 5 do
      pdf.font_size 8
      pdf.font 'OpenSans', style: :italic
      pdf.text "Talk #:"
      pdf.font 'OpenSans', style: :normal
    end
  end
  pdf.move_down 10
  dl(pdf, "Description:", contribution.description, pdf.bounds.width, 12, font_size: 12)
  pdf.move_down 5
  pdf.bounding_box [0, pdf.cursor], width: pdf.bounds.width, height: pdf.cursor do
    pdf.stroke_bounds
    pdf.move_down 5
    pdf.indent 5 do
      pdf.font_size 8
      pdf.font 'OpenSans', style: :italic
      pdf.text "Votes:"
    end
    pdf.svg IO.read(File.join(Rails.root, 'app/assets/images/UNCONF_GREY.svg')), position: :center, vposition: :center
  end
end


prawn_document do |pdf|
  pdf.font_families.update('OpenSans' => {
    bold: File.join(Rails.root, 'app/assets/fonts/open-sans/OpenSans-Bold.ttf'),
    italic: File.join(Rails.root, 'app/assets/fonts/open-sans/OpenSans-Italic.ttf'),
    normal: File.join(Rails.root, 'app/assets/fonts/open-sans/OpenSans-Regular.ttf'),
    bold_italic: File.join(Rails.root, 'app/assets/fonts/open-sans/OpenSans-BoldItalic.ttf')
  })

  @contributions.each do |contribution|
    render_contribution(pdf, contribution)
  end
  @interests.each do |contribution|
    render_contribution(pdf, contribution, interest: true)
  end
end
