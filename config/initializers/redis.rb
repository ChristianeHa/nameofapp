
if Rails.env.production?

	$redis = Redis.new(url: ENV["redis://h:p8a2e8f271838ea487abffe008799a1671d1233c85acb8b1e9e2592ce41c35e4a@ec2-34-206-56-226.compute-1.amazonaws.com:23999"])

else


	$redis = Redis.new(:host => 'localhost', :port => 6379)

end