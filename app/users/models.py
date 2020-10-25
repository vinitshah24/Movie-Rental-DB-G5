from config import MYSQL_DATABASE_DB

PERSON_TABLE = "person"
USER_TABLE = "user"
ADMIN_TABLE = "admin"

SELECT_USER_DETAILS = """SELECT u.user_id, p.username, p.first_name, p.last_name,
p.birthdate, p.street, p.city, p.state, p.zip, p.phone, p.email, p.data_joined
FROM {database}.{user_table} u
JOIN {database}.{person_table} p
ON u.person_id = p.person_id
""".format(database=MYSQL_DATABASE_DB,
           user_table=USER_TABLE,
           person_table=PERSON_TABLE).replace('\n', ' ')
