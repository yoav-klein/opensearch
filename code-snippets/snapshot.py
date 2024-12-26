from opensearchpy import OpenSearch
from datetime import datetime

import string
import random


# Configuration
opensearch_domain = "http://localhost:9200"  # Replace with your OpenSearch domain

# Initialize the OpenSearch client
client = OpenSearch(
    hosts=[opensearch_domain],
    verify_certs=False
)

def get_last_indices(retention):
    try:
        indices = client.cat.indices(format="json")
        index_details = []
        for index in indices:
            index_name = index['index']
            # Fetch index metadata
            metadata = client.indices.get(index=index_name)
            creation_date_epoch = metadata[index_name]['settings']['index']['creation_date']
            creation_date = datetime.fromtimestamp(int(creation_date_epoch) / 1000)  # Convert to human-readable format
            
            index_details.append({
                'name': index_name,
                'creation_date': creation_date,
            })

        # Sort indices by creation date
        index_details.sort(key=lambda x: x['creation_date'])

        return index_details[-retention:]
        
    except Exception as e:
        print(f"Error fetching indices with creation dates: {e}")


def _random():
    return ''.join(random.choices(string.ascii_letters, k=7)) # initializing size of string



def take_snapshot():
    indices = ",".join([index['name'] for index in get_last_indices(2)])
    print(indices)
    snapshot_response = client.snapshot.create(
        repository="my-repository",
        snapshot=f"snapshot-{_random()}".lower(),
        body={"indices": indices}
    )

    print(snapshot_response)


take_snapshot()
