from uptime_kuma_api import UptimeKumaApi, MonitorType
import os

api = UptimeKumaApi('http://localhost:3001')

if api.need_setup():
	result = api.setup(os.environ['UK_USER'], os.environ['UK_PASS'])
	if result['msg'] == 'Added Successfully.':
		print('Admin created successfully')
	else:
		print('Error creating admin: ', result)

if not "UK_SITE_NAME" in os.environ or not "UK_SITE_URL" in os.environ:
	print('Skipping site configuration, missing site name or url')
	api.disconnect()
	exit(0)

result = api.login(os.environ['UK_USER'], os.environ['UK_PASS'])

# Add monitor
if (len(api.get_monitors()) < 1):
	result = api.add_monitor(
		type=MonitorType.HTTP,
		name=os.environ['UK_SITE_NAME'],
		url=os.environ['UK_SITE_URL'],
		ignoreTls=True,
        body='{"status":"ok"}', # healthcheck
	)
	if result['msg'] == 'Added Successfully.':
		print('Monitor added successfully')
	else:
		print('Error adding monitor: ', result)

# Create status page
if (len(api.get_status_pages()) < 1):
	result = api.add_status_page('default', 'Default')
	if result['msg'] == 'OK!':
		print('Status page created successfully')

		# Adding monitor to status page
		result = api.save_status_page('default', publicGroupList=[
			{
				'name': 'Services',
				'weight': 1,
				'monitorList': [
					{'id': 1, 'name': os.environ['UK_SITE_NAME'], 'sendUrl': 0}
				]
			}
		])
		print('Monitor successfully added to status page')
	else:
		print('Error creating status page: ', result)

api.disconnect()

