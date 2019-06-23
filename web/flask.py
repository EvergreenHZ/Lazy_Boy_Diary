import json
# get this object
from flask import Response

'''
jsonify a list
'''
js = [ { "name" : filename,
         "size" : st.st_size ,
         "url" : url_for('show', filename=filename)} ]
#then do this
return Response(json.dumps(js),  mimetype='application/json')


'''
bytes-string to json format
'''
s = b'[{"data":"hello"}]'
t = s.decode('utf-8')
data = json.loads(t)  #
#x = json.dumps(data)
