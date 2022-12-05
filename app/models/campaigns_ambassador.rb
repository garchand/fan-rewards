require 'rqrcode'

class CampaignsAmbassador < ApplicationRecord
  belongs_to :campaign
  belongs_to :user

  after_create :get_client_qr_code
  after_create :get_ambassador_qr_code

  def get_client_qr_code
    qr = RQRCode::QRCode.new("http://localhost:3000/campaigns_ambassadors/#{id}/client_
      code")
    self.client_code = qr.as_svg(
      color: "000",
      shape_rendering: "crispEdges",
      module_size: 11,
      standalone: true,
      use_path: true
    )
    save
  end

  def get_ambassador_qr_code
    qr = RQRCode::QRCode.new("http://localhost:3000/campaigns_ambassadors/#{id}/ambassador_
      code")
    self.ambassador_code = qr.as_svg(
      color: "000",
      shape_rendering: "crispEdges",
      module_size: 11,
      standalone: true,
      use_path: true
    )
    save
  end
end
