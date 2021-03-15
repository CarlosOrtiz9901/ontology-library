using VDS.RDF.Query;
using System;
using System.Data;

namespace LibraryOntology.Data
{
    public class Connection
    {
        private static readonly string URL_SPARQL = @"http://localhost:3030/BiblotecaPlus/sparql";

        public DataTable GetAllBooks()
        {
            string consulta = @"PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
                                PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
                                PREFIX owl: <http://www.w3.org/2002/07/owl#>
                                PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
                                PREFIX data: <http://www.semanticweb.org/lizethycarlos/ontologies/2021/2/untitled-ontology-8#>
                                SELECT ?Nombre ?Puntuacion ?Paginas ?Sipnosis ?Imagen ?Tipo  
                                WHERE{ 
	                                ?Libro data:Nombre ?Nombre.
	                                ?Libro data:Puntuacion ?Puntuacion.
	                                ?Libro data:Paginas ?Paginas.
	                                ?Libro data:Sipnosis ?Sipnosis.
	                                ?Libro data:Imagen ?Imagen.
	                                ?Libro data:tiene_un ?Genero.
	                                ?Genero data:Tipo ?Tipo .
                                }";
            return ExecuteQuery(consulta);
        }

        public DataTable GetAllAuthor()
        {
            string consulta = @"PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
                                PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
                                PREFIX owl: <http://www.w3.org/2002/07/owl#>
                                PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
                                PREFIX data: <http://www.semanticweb.org/lizethycarlos/ontologies/2021/2/untitled-ontology-8#>
                                SELECT ?Nombre ?Nacionalidad ?Edad ?Imagen
                                WHERE{
                                    ?Libro data:es_escrito_por ?Autor.
                                    ?Autor data:Nombre ?Nombre.
                                    ?Autor data:Nacionalidad ?Nacionalidad.
                                    ?Autor data:Edad ?Edad.
                                    ?Autor data:Imagen ?Imagen.
                               }";
            return ExecuteQuery(consulta);
        }

        public DataTable GetThreeAuthor()
        {
            string consulta = @"PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
                                PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
                                PREFIX owl: <http://www.w3.org/2002/07/owl#>
                                PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
                                PREFIX data: <http://www.semanticweb.org/lizethycarlos/ontologies/2021/2/untitled-ontology-8#>
                                SELECT ?Libro ?Autor ?Nombre ?Nacionalidad ?Edad ?Imagen
                                WHERE{
                                    ?Libro data:es_escrito_por ?Autor.
                                    ?Autor data:Nombre ?Nombre.
                                    ?Autor data:Nacionalidad ?Nacionalidad.
                                    ?Autor data:Edad ?Edad.
                                    ?Autor data:Imagen ?Imagen.
                               }
                                ORDER BY ?Edad
                                LIMIT 3";
            return ExecuteQuery(consulta);
        }

        public DataTable GetAllClientBooks()
        {
            string consulta = @"PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
                                PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
                                PREFIX owl: <http://www.w3.org/2002/07/owl#>
                                PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
                                PREFIX data: <http://www.semanticweb.org/lizethycarlos/ontologies/2021/2/untitled-ontology-8#>
                                SELECT ?Nombre ?Nacionalidad ?Edad
                                WHERE{
                                    ?Libro data:se_presta_a ?Usuario.
                                    ?Usuario data:Nombre ?Nombre.
                                    ?Usuario data:Nacionalidad ?Nacionalidad.
                                    ?Usuario data:Edad ?Edad.
                               }";
            return ExecuteQuery(consulta);
        }

        public DataTable GetBooksBySynopsis(string word)
        {
            string consulta = @"PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
                                PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
                                PREFIX owl: <http://www.w3.org/2002/07/owl#>
                                PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
                                PREFIX data: <http://www.semanticweb.org/lizethycarlos/ontologies/2021/2/untitled-ontology-8#>
                                SELECT ?Libro ?Nombre ?Puntuacion ?Paginas ?Sipnosis ?Genero ?Tipo ?Imagen
                                WHERE{
                                    ?Libro data:Nombre ?Nombre.
                                    ?Libro data:Puntuacion ?Puntuacion.
                                    ?Libro data:Paginas ?Paginas.
                                    ?Libro data:Sipnosis ?Sipnosis.
                                    ?Libro data:Imagen ?Imagen.
                                    ?Libro data:tiene_un ?Genero.
                                    ?Genero data:Tipo ?Tipo .
                                FILTER regex(?Sipnosis,'" + word + "') }";
            return ExecuteQuery(consulta);
        }

        public DataTable GetBooksByName(string word)
        {
            string consulta = @"PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
                                PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
                                PREFIX owl: <http://www.w3.org/2002/07/owl#>
                                PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
                                PREFIX data: <http://www.semanticweb.org/lizethycarlos/ontologies/2021/2/untitled-ontology-8#>
                                SELECT ?Libro ?Nombre ?Puntuacion ?Paginas ?Sipnosis ?Genero ?Tipo ?Imagen
                                WHERE{
                                    ?Libro data:Nombre ?Nombre.
                                    ?Libro data:Puntuacion ?Puntuacion.
                                    ?Libro data:Paginas ?Paginas.
                                    ?Libro data:Sipnosis ?Sipnosis.
                                    ?Libro data:Imagen ?Imagen.
                                    ?Libro data:tiene_un ?Genero.
                                    ?Genero data:Tipo ?Tipo .
                                FILTER regex(?Nombre,'" + word + "') }";
            return ExecuteQuery(consulta);
        }

        public DataTable GetBooksByProproperty(string proproperty, string word)
        {
            string consulta = @"PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
                            PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
                            PREFIX owl: <http://www.w3.org/2002/07/owl#>
                            PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
                            PREFIX data: <http://www.semanticweb.org/lizethycarlos/ontologies/2021/2/untitled-ontology-8#>
                            SELECT ?Libro ?Nombre ?Puntuacion ?Paginas ?Sipnosis ?Genero ?Tipo ?Imagen
                            WHERE{
                                ?Libro data:Nombre ?Nombre.
                                ?Libro data:Puntuacion ?Puntuacion.
                                ?Libro data:Paginas ?Paginas.
                                ?Libro data:Sipnosis ?Sipnosis.
                                ?Libro data:Imagen ?Imagen.
                                ?Libro data:tiene_un ?Genero.
                                ?Genero data:Tipo ?Tipo .
                          FILTER regex(?" + proproperty + ", '" + word + "')}";
            return ExecuteQuery(consulta);
        }

        public DataTable GetAllLiteraryGenre()
        {
            string consulta = @"PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
                                PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
                                PREFIX owl: <http://www.w3.org/2002/07/owl#>
                                PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
                                PREFIX data: <http://www.semanticweb.org/lizethycarlos/ontologies/2021/2/untitled-ontology-8#>
                                SELECT DISTINCT ?Tipo
                                WHERE{
                                    ?Libro data:tiene_un ?Genero.
                                    ?Genero data:Tipo ?Tipo .
                                }";
            return ExecuteQuery(consulta);
        }

        public DataTable GetBestBook()
        {
            string consulta = @"PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
                                PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
                                PREFIX owl: <http://www.w3.org/2002/07/owl#>
                                PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
                                PREFIX data: <http://www.semanticweb.org/lizethycarlos/ontologies/2021/2/untitled-ontology-8#>
                                SELECT ?Nombre ?Puntuacion ?Paginas ?Sipnosis ?Tipo ?Imagen
                                WHERE{
                                    ?Libro data:Nombre ?Nombre.
                                    ?Libro data:Puntuacion ?Puntuacion.
                                    ?Libro data:Paginas ?Paginas.
                                    ?Libro data:Sipnosis ?Sipnosis.
                                    ?Libro data:Imagen ?Imagen.
                                    ?Libro data:tiene_un ?Genero.
                                    ?Genero data:Tipo ?Tipo . 
                                }
                                ORDER BY DESC(?Puntuacion)
                                LIMIT 1";
            return ExecuteQuery(consulta);
        }

        public DataTable GetAllEditorial()
        {
            string consulta = @"PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
                                PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
                                PREFIX owl: <http://www.w3.org/2002/07/owl#>
                                PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
                                PREFIX data: <http://www.semanticweb.org/lizethycarlos/ontologies/2021/2/untitled-ontology-8#>
                                SELECT ?Nombre ?Nacionalidad ?year
                                WHERE{
                                ?Libro data:es_publicada_por ?Editorial.
                                ?Editorial data:Nombre ?Nombre.
                                ?Editorial data:Nacionalidad ?Nacionalidad.
                                ?Editorial data:Año ?year.
                                }
                                ORDER BY DESC(?year)";
            return ExecuteQuery(consulta);
        }

        public DataTable GetAllBestSellers()
        {
            string consulta = @"PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
                                PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
                                PREFIX owl: <http://www.w3.org/2002/07/owl#>
                                PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
                                PREFIX data: <http://www.semanticweb.org/lizethycarlos/ontologies/2021/2/untitled-ontology-8#>
                                SELECT ?Nombre ?Puntuacion ?Paginas ?Sipnosis ?Tipo ?Imagen
                                WHERE{
                                    ?Libro data:Nombre ?Nombre.
                                    ?Libro data:Puntuacion ?Puntuacion.
                                    ?Libro data:Paginas ?Paginas.
                                    ?Libro data:Sipnosis ?Sipnosis.
                                    ?Libro data:Imagen ?Imagen.
                                    ?Libro data:tiene_un ?Genero.
                                    ?Genero data:Tipo ?Tipo . 
                                }
                                ORDER BY DESC(?Puntuacion)";
            return ExecuteQuery(consulta);
        }

        public DataTable GetBooksByLiteraryGenre(string name)
        {
            string consulta = @"PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
                                PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
                                PREFIX owl: <http://www.w3.org/2002/07/owl#>
                                PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
                                PREFIX data: <http://www.semanticweb.org/lizethycarlos/ontologies/2021/2/untitled-ontology-8#>
                                SELECT ?Libro ?Nombre ?Puntuacion ?Paginas ?Sipnosis ?Imagen ?Genero ?Tipo
                                WHERE{
                                    ?Libro data:Nombre ?Nombre.
                                    ?Libro data:Puntuacion ?Puntuacion.
                                    ?Libro data:Paginas ?Paginas.
                                    ?Libro data:Sipnosis ?Sipnosis.
                                    ?Libro data:Imagen ?Imagen.
                                    ?Libro data:tiene_un ?Genero.
                                    ?Genero data:Tipo ?Tipo .
                               FILTER regex(?Tipo,'" + name + "') }";
            return ExecuteQuery(consulta);
        }

        public DataTable ExecuteQuery(string query)
        {
            SparqlRemoteEndpoint endPoint = new SparqlRemoteEndpoint(new Uri(URL_SPARQL));
            SparqlResultSet setResult = endPoint.QueryWithResultSet(query);

            DataTable dataTable = new DataTable();
            var columns = setResult.Variables;
            foreach (string s in columns)
            {
                dataTable.Columns.Add(new DataColumn(s, typeof(string)));
            }

            foreach (var value in setResult.Results)
            {
                DataRow dateRow = dataTable.NewRow();
                foreach (var replay in value)
                {
                    dateRow[replay.Key] = replay.Value;
                }
                dataTable.Rows.Add(dateRow);
            }

            return dataTable;
        }
    }
}