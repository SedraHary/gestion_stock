import pandas as pd
import psycopg2
import traceback
chemin_fichier_excel = 'D:/Freelance/liste_des_produits.xlsx'
try:
	conn = psycopg2.connect("dbname='g_stock' user='postgres' host='localhost' password='sedra' connect_timeout=1 ")
	
	cursor = conn.cursor()
	
	xls = pd.ExcelFile(chemin_fichier_excel)
	for sheet_name in xls.sheet_names:
		df = pd.read_excel(xls, sheet_name=xls.sheet_names)
		for index, row in df.items():
			try:
				for col_index, (column_name, cell_value) in enumerate(row.items()):
						for i, list_value in enumerate(cell_value):
							# print(row.keys())
							nom = row['NOM'][i]
							detail = row['DETAIL'][i]
							unite = row['UNITE'][i]
							pv_det = int(row['PV_Det'][i])
							pv_gros = int(row['PV Gros'][i])
							pv_rev = int(row['PV Rev'][i])
							pa = int(row['PA'][i])
							print(f"nom: {nom},detail: {detail},unite: {unite},pv_det: {pv_det},pv_gros: {pv_gros},pv_rev: {pv_rev},pa: {pa}")
							query = f"INSERT INTO test (testid, articlefamily, articlename, articledetail, articleunit, articlepv_det, articlepv_gros, articlepv_rev, articlepa) VALUES (DEFAULT, %s, %s, %s, %s, %s, %s, %s, %s);"
							values = (sheet_name,nom, detail,unite, pv_det,pv_gros, pv_rev,pa)  # Convertir une ligne du DataFrame en tuple pour les valeurs
							cursor.execute(query, values)
			except Exception as e:
				traceback.print_exc()
		
	conn.commit()	
	cursor.close()
	conn.close()
except Exception as e:
	print("Connexion à la base de données NOOOONNN !",e)
	traceback.print_exc()
