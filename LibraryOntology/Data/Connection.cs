using VDS.RDF.Query;
using System;
using System.Data;

namespace LibraryOntology.Data
{
    public class Connection
    {
        //private static string baseURL = @"http://localhost:3030/ontofrutis/data";



        private static string baseURL = @"http://localhost:3030/proyectoFinalPeliculas/sparql";


        //private static string baseURL = @"http://dbpedia.org/sparql";

        public Connection()
        {
            // Vanessa De Blass
        }
        /*
        public DataTable ConsultarDatosGenerales(string variable, string valor)
        {
            string consulta = @"PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
                                PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
                                PREFIX data: <http://localhost:3030/dependencias/data#>
                                PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
                                SELECT ?dependencia ?nombre ?funcion ?ubicacion
                                WHERE {
  	                                ?dependencia data:nombre ?nombre.
  	                                ?dependencia data:funcion ?funcion.
  	                                ?dependencia data:ubicacion ?ubicacion.
  	                                FILTER regex(?" + variable + ", '" + valor + "', 'i')} ";
            return EjecutarConsulta(consulta);
        }*/
        public DataTable ConsultarGeneral()
        {
            string consulta = @"PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
                                PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
                                PREFIX owl: <http://www.w3.org/2002/07/owl#>
                                PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
                                PREFIX data: <http://www.semanticweb.org/sebastianobregon/ontologies/2020/8/untitled-ontology-5#>
                                    SELECT ?Pelicula ?Imagen ?Nombre ?Duracion ?Sinopsis ?Puntuacion ?Genero ?Tipo
                                    WHERE{
                                        ?Pelicula data:Imagen ?Imagen.
                                        ?Pelicula data:Puntuacion ?Puntuacion.
                                        ?Pelicula data:Nombre ?Nombre.
                                        ?Pelicula data:Duracion ?Duracion.
                                        ?Pelicula data:Sinopsis ?Sinopsis.
                                        ?Pelicula data:tiene_un ?Genero.
                                    }";
            return EjecutarConsulta(consulta);
        }

        public DataTable ConsultarPelicula(string termino, string tipo)
        {
            string consulta = @"PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
                                PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
                                PREFIX owl: <http://www.w3.org/2002/07/owl#>
                                PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
                                PREFIX data: <http://www.semanticweb.org/sebastianobregon/ontologies/2020/8/untitled-ontology-5#>
                                    SELECT ?Imagen ?Nombre ?Duracion ?Sinopsis ?Puntuacion
                                    WHERE{
                                        ?Pelicula data:Imagen ?Imagen.
                                        ?Pelicula data:Puntuacion ?Puntuacion.
                                        ?Pelicula data:Nombre ?Nombre.
                                        ?Pelicula data:Duracion ?Duracion.
                                        ?Pelicula data:Sinopsis ?Sinopsis.
                                        FILTER regex(?" + tipo + ", '" + termino + "')}";
            return EjecutarConsulta(consulta);
        }


        public DataTable GetSubdependencias(string nombre)
        {
            SparqlRemoteEndpoint endpoint = new SparqlRemoteEndpoint(new Uri(baseURL));
            string consulta = @"PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
                                PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
                                PREFIX data: <http://localhost:3030/dependencias/data#>
                                PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
                                SELECT ?padre ?nombre_padre ?hijo ?nombre_hijo ?funcion ?ubicacion
                                WHERE {
                                  ?padre data:divide_en ?hijo.
                                  ?padre data:nombre ?nombre_padre.
                                  ?hijo data:nombre ?nombre_hijo.
                                  ?hijo data:funcion ?funcion.
                                  ?hijo data:ubicacion ?ubicacion.
                                  FILTER regex(?nombre_padre, '" + nombre + "', 'i').}";
            return EjecutarConsulta(consulta);
        }

        public DataTable GetDependenciaPadre(string nombre)
        {
            SparqlRemoteEndpoint endpoint = new SparqlRemoteEndpoint(new Uri(baseURL));
            string consulta = @"PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
                                PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
                                PREFIX data: <http://localhost:3030/dependencias/data#>
                                PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
                                SELECT ?hijo ?nombre_hijo ?padre ?nombre_padre ?funcion ?ubicacion
                                WHERE {
                                  ?padre data:divide_en ?hijo.
                                  ?padre data:nombre ?nombre_padre.
                                  ?hijo data:nombre ?nombre_hijo.
                                  ?padre data:funcion ?funcion.
                                  ?padre data:ubicacion ?ubicacion.
                                FILTER regex(?nombre_hijo, '" + nombre + "', 'i').}";
            return EjecutarConsulta(consulta);
        }

        public DataTable EjecutarConsulta(string query)
        {
            //try {
            SparqlRemoteEndpoint endpoint = new SparqlRemoteEndpoint(new Uri(baseURL));
            SparqlResultSet srs = endpoint.QueryWithResultSet(query);

            DataTable dt = new DataTable();
            var columnas = srs.Variables;
            foreach (string s in columnas)
            {
                dt.Columns.Add(new DataColumn(s, typeof(string)));
            }

            foreach (var item in srs.Results)
            {
                DataRow dr = dt.NewRow();
                foreach (var resutado in item)
                {
                    dr[resutado.Key] = resutado.Value;
                }
                dt.Rows.Add(dr);
            }
            //}catch(Exception ex) {
            //    return null;
            //}
            return dt;
        }
    }
}